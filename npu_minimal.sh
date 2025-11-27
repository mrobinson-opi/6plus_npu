#!/bin/bash

# Orange Pi 6 Plus NPU Setup Assistant
# Optimized for Minimal Download (Only ResNet50 test model)

# Colors for formatting
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

HUB_DIR="/home/orangepi/ai_model_hub_25_Q3"

echo -e "${GREEN}================================================${NC}"
echo -e "${GREEN}   Orange Pi 6 Plus NPU Setup & Test Utility    ${NC}"
echo -e "${GREEN}================================================${NC}"

# Check for Root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}This script must be run as root (use sudo).${NC}"
   exit 1
fi

# ----------------------------------------------------------------------
# --- Step 1: Download Model Hub ---
# ----------------------------------------------------------------------
echo -e "\n${YELLOW}[Step 1] Download CIX AI Model Hub${NC}"
echo "------------------------------------------------"
echo "Select Download Option:"
echo "1) Minimal Setup (~50MB-1GB): Downloads ONLY the files needed for NPU setup and the ResNet50 test model."
echo "2) Full Hub (~60GB-120GB): Downloads the entire collection of all CIX AI models."
echo "3) Skip Download: Assuming Hub is already at $HUB_DIR"
read -p "Enter choice (1, 2, or 3): " download_choice

if [[ "$download_choice" == "1" || "$download_choice" == "2" ]]; then
    
    echo "Updating package lists and installing Git LFS..."
    apt-get update
    apt-get install -y git-lfs
    
    echo "Cloning repository structure (excluding large files initially)..."
    cd /home/orangepi
    
    # Use GIT_LFS_SKIP_SMUDGE to clone the structure without downloading large files
    GIT_LFS_SKIP_SMUDGE=1 git clone https://www.modelscope.cn/cix/ai_model_hub_25_Q3.git
    
    if [ ! -d "$HUB_DIR" ]; then
        echo -e "${RED}Clone failed.${NC}"
        exit 1
    fi
    
    cd "$HUB_DIR"
    
    if [[ "$download_choice" == "1" ]]; then
        echo -e "${GREEN}Selected Minimal Setup. Downloading only ResNet50 model...${NC}"
        TEST_MODEL_PATH="models/ComputeVision/Image_Classification/onnx_resnet_v1_50/resnet_v1_50.cix"
        
        # Use git lfs pull --include to fetch only the required model
        git lfs pull --include="$TEST_MODEL_PATH"
        
        # Check if the file was downloaded successfully (by checking size)
        if [ -f "$TEST_MODEL_PATH" ]; then
            MODEL_SIZE=$(du -h "$TEST_MODEL_PATH" | awk '{print $1}')
            echo -e "${GREEN}ResNet50 model download finished. Size: ${MODEL_SIZE}${NC}"
        fi
        
    elif [[ "$download_choice" == "2" ]]; then
        echo -e "${GREEN}Selected Full Hub. Downloading all models (~60GB+)...${NC}"
        # Trigger the download for all LFS files
        git lfs pull
    fi
    
    echo -e "${GREEN}Download step finished.${NC}"

elif [[ "$download_choice" == "3" ]]; then
    echo "Skipping download. Assuming Hub is located at $HUB_DIR"
else
    echo -e "${RED}Invalid choice. Exiting.${NC}"
    exit 1
fi

# ----------------------------------------------------------------------
# --- Step 2: Install Dependencies ---
# ----------------------------------------------------------------------
echo -e "\n${YELLOW}[Step 2] Install System & Python Dependencies${NC}"
read -p "Install required dependencies? (y/n): " dep_choice

if [[ "$dep_choice" == "y" ]]; then
    echo "Installing system tools (cmake, python3-pip)..."
    apt-get update
    apt-get install -y cmake python3-pip

    if [ -d "$HUB_DIR" ]; then
        echo "Installing Python requirements from Hub..."
        cd "$HUB_DIR"
        pip3 install -r requirements.txt --break-system-packages
        echo -e "${GREEN}System and Python dependencies installed.${NC}"
    else
        echo -e "${RED}Model Hub directory not found. Cannot install specific Python requirements.${NC}"
    fi
fi

# ----------------------------------------------------------------------
# --- Step 3: Install NPU Runtime ---
# ----------------------------------------------------------------------
echo -e "\n${YELLOW}[Step 3] Install Zhouyi NPU Runtime${NC}"
echo "This replaces the standard CPU-based ONNX runtime with the NPU version."
read -p "Proceed with NPU Runtime installation? (y/n): " runtime_choice

if [[ "$runtime_choice" == "y" ]]; then
    echo "Uninstalling standard onnxruntime..."
    pip3 uninstall -y onnxruntime --break-system-packages

    echo "Installing onnxruntime_zhouyi..."
    WHL_PATH=$(find /usr/share/cix/pypi/ -name "onnxruntime_zhouyi-*.whl" | head -n 1)

    if [ -f "$WHL_PATH" ]; then
        echo "Found installer: $WHL_PATH"
        pip3 install "$WHL_PATH" --break-system-packages --force-reinstall
        echo -e "${GREEN}NPU Runtime installed successfully.${NC}"
    else
        echo -e "${RED}Error: NPU Runtime .whl file not found in /usr/share/cix/pypi/.${NC}"
        echo "Please ensure you are using the official Orange Pi image."
    fi
fi

# ----------------------------------------------------------------------
# --- Step 4: Verify Driver ---
# ----------------------------------------------------------------------
echo -e "\n${YELLOW}[Step 4] Verifying NPU Driver Version${NC}"
DRIVER_CHECK=$(dpkg -l | grep cix-npu-onnxruntime)
if [[ -n "$DRIVER_CHECK" ]]; then
    echo -e "${GREEN}Driver package found:${NC}"
    echo "$DRIVER_CHECK"
else
    echo -e "${RED}Warning: cix-npu-onnxruntime package not found via dpkg.${NC}"
fi

# ----------------------------------------------------------------------
# --- Step 5: Run Inference Test ---
# ----------------------------------------------------------------------
echo -e "\n${YELLOW}[Step 5] Run Test Inference (ResNet50)${NC}"
read -p "Run the ResNet50 image classification test on NPU? (y/n): " test_choice

if [[ "$test_choice" == "y" ]]; then
    TEST_DIR="$HUB_DIR/models/ComputeVision/Image_Classification/onnx_resnet_v1_50"
    
    if [ -d "$TEST_DIR" ]; then
        cd "$TEST_DIR"
        echo "Running inference_npu.py..."
        # The script works because the other necessary files (like inference_npu.py) are small 
        # Git files that were cloned in step 1, even in the minimal mode.
        python3 inference_npu.py --images test_data --model_path resnet_v1_50.cix
        
        echo -e "\n${GREEN}If you see 'npu: noe_create_job success' above, the NPU is working!${NC}"
    else
        echo -e "${RED}Test directory not found. Please ensure the Model Hub was cloned successfully.${NC}"
    fi
fi

echo -e "\n${GREEN}================================================${NC}"
echo -e "${GREEN}   Setup script complete.   ${NC}"
echo -e "${GREEN}================================================${NC}"
