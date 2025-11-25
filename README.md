This is my attempt at a script to automate setup of the npu and testing of it on Orange Pi 6 Plus only. 
This is a large download have 100gb available.

First setup a python venv. 

Download npu.sh 
:
chmod +x npu.sh
:
sudo ./npu.sh
:
Let me know how it goes. 

Here is sample run
:

Cloning repository (this may take a while)...
Cloning into 'ai_model_hub_25_Q3'...
remote: Enumerating objects: 1410, done.
remote: Counting objects: 100% (1410/1410), done.
remote: Compressing objects: 100% (1035/1035), done.
remote: Total 1410 (delta 263), reused 1402 (delta 262), pack-reused 0
Receiving objects: 100% (1410/1410), 54.76 MiB | 7.57 MiB/s, done.
Resolving deltas: 100% (263/263), done.
./npu.sh: line 46: 10302 Killed                  git clone https://www.modelscope.cn/cix/ai_model_hub_25_Q3.git
Download complete.

[Step 2] Install System & Python Dependencies
Install required dependencies? (y/n): y
Installing system tools...
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
python3-pip is already the newest version (23.0.1+dfsg-1).
The following additional packages will be installed:
  cmake-data libjsoncpp25 librhash0
Suggested packages:
  cmake-doc cmake-format elpa-cmake-mode ninja-build
The following NEW packages will be installed:
  cmake cmake-data libjsoncpp25 librhash0
0 upgraded, 4 newly installed, 0 to remove and 15 not upgraded.
Need to get 9,036 kB of archives.
After this operation, 36.9 MB of additional disk space will be used.
Get:1 http://repo.huaweicloud.com/debian bookworm/main arm64 libjsoncpp25 arm64 1.9.5-4 [72.3 kB]
Get:2 http://repo.huaweicloud.com/debian bookworm/main arm64 librhash0 arm64 1.4.3-3 [131 kB]
Get:3 http://repo.huaweicloud.com/debian bookworm/main arm64 cmake-data all 3.25.1-1 [2,026 kB]
Get:4 http://repo.huaweicloud.com/debian bookworm/main arm64 cmake arm64 3.25.1-1 [6,806 kB]
Fetched 9,036 kB in 1s (9,307 kB/s)
Selecting previously unselected package libjsoncpp25:arm64.
(Reading database ... 132438 files and directories currently installed.)
Preparing to unpack .../libjsoncpp25_1.9.5-4_arm64.deb ...
Unpacking libjsoncpp25:arm64 (1.9.5-4) ...
Selecting previously unselected package librhash0:arm64.
Preparing to unpack .../librhash0_1.4.3-3_arm64.deb ...
Unpacking librhash0:arm64 (1.4.3-3) ...
Selecting previously unselected package cmake-data.
Preparing to unpack .../cmake-data_3.25.1-1_all.deb ...
Unpacking cmake-data (3.25.1-1) ...
Selecting previously unselected package cmake.
Preparing to unpack .../cmake_3.25.1-1_arm64.deb ...
Unpacking cmake (3.25.1-1) ...
Setting up libjsoncpp25:arm64 (1.9.5-4) ...
Setting up librhash0:arm64 (1.4.3-3) ...
Setting up cmake-data (3.25.1-1) ...
Setting up cmake (3.25.1-1) ...
Processing triggers for man-db (2.11.2-2) ...
Processing triggers for libc-bin (2.36-9+deb12u13) ...
Installing Python requirements from Hub...
Collecting onnx
  Downloading onnx-1.19.1-cp311-cp311-manylinux2014_aarch64.manylinux_2_17_aarch64.whl (18.0 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 18.0/18.0 MB 3.1 MB/s eta 0:00:00
Collecting numpy==1.26
  Downloading numpy-1.26.0-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (14.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 14.2/14.2 MB 2.3 MB/s eta 0:00:00
Collecting scikit-image
  Downloading scikit_image-0.25.2-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (14.1 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 14.1/14.1 MB 1.4 MB/s eta 0:00:00
Collecting scikit-learn
  Downloading scikit_learn-1.7.2-cp311-cp311-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl (9.5 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 9.5/9.5 MB 2.0 MB/s eta 0:00:00
Collecting ultralytics
  Downloading ultralytics-8.3.232-py3-none-any.whl (1.1 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.1/1.1 MB 3.4 MB/s eta 0:00:00
Collecting onnx_tool
  Downloading onnx_tool-0.9.0-py3-none-any.whl (44 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 44.5/44.5 kB 843.4 kB/s eta 0:00:00
Collecting pillow==10.4.0
  Downloading pillow-10.4.0-cp311-cp311-manylinux_2_28_aarch64.whl (4.4 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 4.4/4.4 MB 2.6 MB/s eta 0:00:00
Collecting pip-system-certs
  Downloading pip_system_certs-5.3-py3-none-any.whl (6.9 kB)
Collecting ffmpeg-python
  Downloading ffmpeg_python-0.2.0-py3-none-any.whl (25 kB)
Collecting torch
  Downloading torch-2.9.1-cp311-cp311-manylinux_2_28_aarch64.whl (104.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 104.2/104.2 MB 2.7 MB/s eta 0:00:00
Collecting transformers
  Downloading transformers-4.57.3-py3-none-any.whl (12.0 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 12.0/12.0 MB 3.7 MB/s eta 0:00:00
Collecting onnxruntime
  Downloading onnxruntime-1.23.2-cp311-cp311-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl (15.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 15.2/15.2 MB 3.4 MB/s eta 0:00:00
Collecting pycocotools
  Downloading pycocotools-2.0.10-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (470 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 470.3/470.3 kB 3.6 MB/s eta 0:00:00
Collecting clip
  Downloading clip-0.2.0.tar.gz (5.5 kB)
  Preparing metadata (setup.py) ... done
Collecting shapely
  Downloading shapely-2.1.2-cp311-cp311-manylinux2014_aarch64.manylinux_2_17_aarch64.whl (3.0 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.0/3.0 MB 2.4 MB/s eta 0:00:00
Collecting pyclipper
  Downloading pyclipper-1.3.0.post6-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (951 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 951.8/951.8 kB 2.4 MB/s eta 0:00:00
Collecting SentencePiece
  Downloading sentencepiece-0.2.1-cp311-cp311-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl (1.3 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.3/1.3 MB 1.7 MB/s eta 0:00:00
Collecting imageio
  Downloading imageio-2.37.2-py3-none-any.whl (317 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 317.6/317.6 kB 1.4 MB/s eta 0:00:00
Collecting openai-clip
  Downloading openai-clip-1.0.1.tar.gz (1.4 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.4/1.4 MB 1.6 MB/s eta 0:00:00
  Preparing metadata (setup.py) ... done
Collecting diffusers
  Downloading diffusers-0.35.2-py3-none-any.whl (4.1 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 4.1/4.1 MB 2.0 MB/s eta 0:00:00
Collecting cn-clip
  Downloading cn_clip-1.6.0-py3-none-any.whl (209 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 209.9/209.9 kB 2.4 MB/s eta 0:00:00
Collecting protobuf>=4.25.1
  Downloading protobuf-6.33.1-cp39-abi3-manylinux2014_aarch64.whl (324 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 324.4/324.4 kB 2.6 MB/s eta 0:00:00
Collecting typing_extensions>=4.7.1
  Downloading typing_extensions-4.15.0-py3-none-any.whl (44 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 44.6/44.6 kB 3.1 MB/s eta 0:00:00
Collecting ml_dtypes>=0.5.0
  Downloading ml_dtypes-0.5.4-cp311-cp311-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl (5.1 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.1/5.1 MB 2.7 MB/s eta 0:00:00
Collecting scipy>=1.11.4
  Downloading scipy-1.16.3-cp311-cp311-manylinux2014_aarch64.manylinux_2_17_aarch64.whl (33.6 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 33.6/33.6 MB 1.6 MB/s eta 0:00:00
Collecting networkx>=3.0
  Downloading networkx-3.6-py3-none-any.whl (2.1 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.1/2.1 MB 1.4 MB/s eta 0:00:00
Collecting tifffile>=2022.8.12
  Downloading tifffile-2025.10.16-py3-none-any.whl (231 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 231.2/231.2 kB 1.4 MB/s eta 0:00:00
Collecting packaging>=21
  Downloading packaging-25.0-py3-none-any.whl (66 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 66.5/66.5 kB 1.6 MB/s eta 0:00:00
Collecting lazy-loader>=0.4
  Downloading lazy_loader-0.4-py3-none-any.whl (12 kB)
Collecting joblib>=1.2.0
  Downloading joblib-1.5.2-py3-none-any.whl (308 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 308.4/308.4 kB 1.7 MB/s eta 0:00:00
Collecting threadpoolctl>=3.1.0
  Downloading threadpoolctl-3.6.0-py3-none-any.whl (18 kB)
Collecting matplotlib>=3.3.0
  Downloading matplotlib-3.10.7-cp311-cp311-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl (9.5 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 9.5/9.5 MB 1.6 MB/s eta 0:00:00
Collecting opencv-python>=4.6.0
  Downloading opencv_python-4.12.0.88-cp37-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.whl (45.9 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 45.9/45.9 MB 1.9 MB/s eta 0:00:00
Collecting pyyaml>=5.3.1
  Downloading pyyaml-6.0.3-cp311-cp311-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl (775 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 775.6/775.6 kB 2.5 MB/s eta 0:00:00
Collecting requests>=2.23.0
  Downloading requests-2.32.5-py3-none-any.whl (64 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 64.7/64.7 kB 2.7 MB/s eta 0:00:00
Collecting torchvision>=0.9.0
  Downloading torchvision-0.24.1-cp311-cp311-manylinux_2_28_aarch64.whl (2.4 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.4/2.4 MB 2.6 MB/s eta 0:00:00
Requirement already satisfied: psutil>=5.8.0 in /usr/lib/python3/dist-packages (from ultralytics->-r requirements.txt (line 5)) (5.9.4)
Collecting polars>=0.20.0
  Downloading polars-1.35.2-py3-none-any.whl (783 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 783.6/783.6 kB 3.3 MB/s eta 0:00:00
Collecting ultralytics-thop>=2.0.18
  Downloading ultralytics_thop-2.0.18-py3-none-any.whl (28 kB)
Collecting tabulate
  Downloading tabulate-0.9.0-py3-none-any.whl (35 kB)
Collecting pip>=24.2
  Downloading pip-25.3-py3-none-any.whl (1.8 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.8/1.8 MB 3.0 MB/s eta 0:00:00
Collecting future
  Downloading future-1.0.0-py3-none-any.whl (491 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 491.3/491.3 kB 3.2 MB/s eta 0:00:00
Collecting filelock
  Downloading filelock-3.20.0-py3-none-any.whl (16 kB)
Collecting sympy>=1.13.3
  Downloading sympy-1.14.0-py3-none-any.whl (6.3 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 6.3/6.3 MB 2.5 MB/s eta 0:00:00
Collecting jinja2
  Downloading jinja2-3.1.6-py3-none-any.whl (134 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 134.9/134.9 kB 2.2 MB/s eta 0:00:00
Collecting fsspec>=0.8.5
  Downloading fsspec-2025.10.0-py3-none-any.whl (200 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 201.0/201.0 kB 2.4 MB/s eta 0:00:00
Collecting huggingface-hub<1.0,>=0.34.0
  Downloading huggingface_hub-0.36.0-py3-none-any.whl (566 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 566.1/566.1 kB 2.1 MB/s eta 0:00:00
Collecting regex!=2019.12.17
  Downloading regex-2025.11.3-cp311-cp311-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl (793 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 793.4/793.4 kB 2.4 MB/s eta 0:00:00
Collecting tokenizers<=0.23.0,>=0.22.0
  Downloading tokenizers-0.22.1-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (3.3 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.3/3.3 MB 2.7 MB/s eta 0:00:00
Collecting safetensors>=0.4.3
  Downloading safetensors-0.7.0-cp38-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (491 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 491.7/491.7 kB 3.0 MB/s eta 0:00:00
Collecting tqdm>=4.27
  Downloading tqdm-4.67.1-py3-none-any.whl (78 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 78.5/78.5 kB 2.7 MB/s eta 0:00:00
Collecting coloredlogs
  Downloading coloredlogs-15.0.1-py2.py3-none-any.whl (46 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 46.0/46.0 kB 2.6 MB/s eta 0:00:00
Collecting flatbuffers
  Downloading flatbuffers-25.9.23-py2.py3-none-any.whl (30 kB)
Collecting ftfy
  Downloading ftfy-6.3.1-py3-none-any.whl (44 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 44.8/44.8 kB 3.3 MB/s eta 0:00:00
Collecting importlib_metadata
  Downloading importlib_metadata-8.7.0-py3-none-any.whl (27 kB)
Requirement already satisfied: six in /usr/lib/python3/dist-packages (from cn-clip->-r requirements.txt (line 21)) (1.16.0)
Collecting timm
  Downloading timm-1.0.22-py3-none-any.whl (2.5 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.5/2.5 MB 2.9 MB/s eta 0:00:00
Collecting lmdb==1.3.0
  Downloading lmdb-1.3.0.tar.gz (881 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 881.4/881.4 kB 3.6 MB/s eta 0:00:00
  Preparing metadata (setup.py) ... done
Collecting hf-xet<2.0.0,>=1.1.3
  Downloading hf_xet-1.2.0-cp37-abi3-manylinux_2_28_aarch64.whl (3.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.2/3.2 MB 2.2 MB/s eta 0:00:00
Collecting contourpy>=1.0.1
  Downloading contourpy-1.3.3-cp311-cp311-manylinux_2_26_aarch64.manylinux_2_28_aarch64.whl (329 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 329.2/329.2 kB 2.4 MB/s eta 0:00:00
Collecting cycler>=0.10
  Downloading cycler-0.12.1-py3-none-any.whl (8.3 kB)
Collecting fonttools>=4.22.0
  Downloading fonttools-4.60.1-cp311-cp311-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl (5.0 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.0/5.0 MB 2.3 MB/s eta 0:00:00
Collecting kiwisolver>=1.3.1
  Downloading kiwisolver-1.4.9-cp311-cp311-manylinux_2_24_aarch64.manylinux_2_28_aarch64.whl (1.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.2/1.2 MB 2.3 MB/s eta 0:00:00
Requirement already satisfied: pyparsing>=3 in /usr/lib/python3/dist-packages (from matplotlib>=3.3.0->ultralytics->-r requirements.txt (line 5)) (3.0.9)
Requirement already satisfied: python-dateutil>=2.7 in /usr/lib/python3/dist-packages (from matplotlib>=3.3.0->ultralytics->-r requirements.txt (line 5)) (2.8.2)
Collecting opencv-python>=4.6.0
  Downloading opencv_python-4.11.0.86-cp37-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl (42.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 42.2/42.2 MB 2.7 MB/s eta 0:00:00
Collecting polars-runtime-32==1.35.2
  Downloading polars_runtime_32-1.35.2-cp39-abi3-manylinux_2_24_aarch64.whl (37.9 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 37.9/37.9 MB 3.1 MB/s eta 0:00:00
Collecting charset_normalizer<4,>=2
  Downloading charset_normalizer-3.4.4-cp311-cp311-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl (147 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 147.3/147.3 kB 3.9 MB/s eta 0:00:00
Collecting idna<4,>=2.5
  Downloading idna-3.11-py3-none-any.whl (71 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 71.0/71.0 kB 2.9 MB/s eta 0:00:00
Requirement already satisfied: urllib3<3,>=1.21.1 in /usr/lib/python3/dist-packages (from requests>=2.23.0->ultralytics->-r requirements.txt (line 5)) (1.26.12)
Collecting certifi>=2017.4.17
  Downloading certifi-2025.11.12-py3-none-any.whl (159 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 159.4/159.4 kB 4.0 MB/s eta 0:00:00
Collecting mpmath<1.4,>=1.1.0
  Downloading mpmath-1.3.0-py3-none-any.whl (536 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 536.2/536.2 kB 3.5 MB/s eta 0:00:00
Collecting humanfriendly>=9.1
  Downloading humanfriendly-10.0-py2.py3-none-any.whl (86 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 86.8/86.8 kB 3.2 MB/s eta 0:00:00
Collecting wcwidth
  Downloading wcwidth-0.2.14-py2.py3-none-any.whl (37 kB)
Collecting zipp>=3.20
  Downloading zipp-3.23.0-py3-none-any.whl (10 kB)
Collecting MarkupSafe>=2.0
  Downloading markupsafe-3.0.3-cp311-cp311-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl (24 kB)
Building wheels for collected packages: clip, openai-clip, lmdb
  Building wheel for clip (setup.py) ... done
  Created wheel for clip: filename=clip-0.2.0-py3-none-any.whl size=6989 sha256=15d7e999d305ce33e8f024d6656421fbc6da09081c993657415231c79b38dbcb
  Stored in directory: /root/.cache/pip/wheels/ab/a5/e8/c9fa20742edbccf2702dae8ee62053e6c460e961d45967b49c
  Building wheel for openai-clip (setup.py) ... done
  Created wheel for openai-clip: filename=openai_clip-1.0.1-py3-none-any.whl size=1368605 sha256=7f4cb8cb3dbdc7c8dd989f8d53483bf4fb6b0e90cd2f4e3d363ed0b3c3caa96e
  Stored in directory: /root/.cache/pip/wheels/0d/17/90/042948fd2e2a87f1dcf6db6d438cad015c49db0c53d1d9c7dc
  Building wheel for lmdb (setup.py) ... done
  Created wheel for lmdb: filename=lmdb-1.3.0-cp311-cp311-linux_aarch64.whl size=261544 sha256=6f82b36478b1a9e875f4a6a1ac0e02ba3ae070428238faf3649808e236a1bc34
  Stored in directory: /root/.cache/pip/wheels/b2/0a/6d/46d6a5fe8f8722fbfafbdd7916b06a6cdbbbacc5a1993282fb
Successfully built clip openai-clip lmdb
Installing collected packages: pyclipper, mpmath, lmdb, flatbuffers, clip, zipp, wcwidth, typing_extensions, tqdm, threadpoolctl, tabulate, sympy, SentencePiece, safetensors, regex, pyyaml, protobuf, polars-runtime-32, pip, pillow, packaging, numpy, networkx, MarkupSafe, kiwisolver, joblib, idna, humanfriendly, hf-xet, future, fsspec, fonttools, filelock, cycler, charset_normalizer, certifi, tifffile, shapely, scipy, requests, pycocotools, polars, pip-system-certs, opencv-python, ml_dtypes, lazy-loader, jinja2, importlib_metadata, imageio, ftfy, ffmpeg-python, contourpy, coloredlogs, torch, scikit-learn, scikit-image, openai-clip, onnxruntime, onnx, matplotlib, huggingface-hub, ultralytics-thop, torchvision, tokenizers, onnx_tool, diffusers, ultralytics, transformers, timm, cn-clip
  Attempting uninstall: pip
    Found existing installation: pip 23.0.1
    Not uninstalling pip at /usr/lib/python3/dist-packages, outside environment /usr
    Can't uninstall 'pip'. No files were found to uninstall.
Successfully installed MarkupSafe-3.0.3 SentencePiece-0.2.1 certifi-2025.11.12 charset_normalizer-3.4.4 clip-0.2.0 cn-clip-1.6.0 coloredlogs-15.0.1 contourpy-1.3.3 cycler-0.12.1 diffusers-0.35.2 ffmpeg-python-0.2.0 filelock-3.20.0 flatbuffers-25.9.23 fonttools-4.60.1 fsspec-2025.10.0 ftfy-6.3.1 future-1.0.0 hf-xet-1.2.0 huggingface-hub-0.36.0 humanfriendly-10.0 idna-3.11 imageio-2.37.2 importlib_metadata-8.7.0 jinja2-3.1.6 joblib-1.5.2 kiwisolver-1.4.9 lazy-loader-0.4 lmdb-1.3.0 matplotlib-3.10.7 ml_dtypes-0.5.4 mpmath-1.3.0 networkx-3.6 numpy-1.26.0 onnx-1.19.1 onnx_tool-0.9.0 onnxruntime-1.23.2 openai-clip-1.0.1 opencv-python-4.11.0.86 packaging-25.0 pillow-10.4.0 pip-25.3 pip-system-certs-5.3 polars-1.35.2 polars-runtime-32-1.35.2 protobuf-6.33.1 pyclipper-1.3.0.post6 pycocotools-2.0.10 pyyaml-6.0.3 regex-2025.11.3 requests-2.32.5 safetensors-0.7.0 scikit-image-0.25.2 scikit-learn-1.7.2 scipy-1.16.3 shapely-2.1.2 sympy-1.14.0 tabulate-0.9.0 threadpoolctl-3.6.0 tifffile-2025.10.16 timm-1.0.22 tokenizers-0.22.1 torch-2.9.1 torchvision-0.24.1 tqdm-4.67.1 transformers-4.57.3 typing_extensions-4.15.0 ultralytics-8.3.232 ultralytics-thop-2.0.18 wcwidth-0.2.14 zipp-3.23.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv

[Step 3] Install Zhouyi NPU Runtime
This replaces the standard CPU-based ONNX runtime with the NPU version.
Proceed with NPU Runtime installation? (y/n): y
Uninstalling standard onnxruntime...
Found existing installation: onnxruntime 1.23.2
Uninstalling onnxruntime-1.23.2:
  Successfully uninstalled onnxruntime-1.23.2
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager, possibly rendering your system unusable. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv. Use the --root-user-action option if you know what you are doing and want to suppress this warning.
Installing onnxruntime_zhouyi...
Found installer: /usr/share/cix/pypi/onnxruntime_zhouyi-1.20.0-cp311-cp311-linux_aarch64.whl
Processing /usr/share/cix/pypi/onnxruntime_zhouyi-1.20.0-cp311-cp311-linux_aarch64.whl
Collecting coloredlogs (from onnxruntime-zhouyi==1.20.0)
  Downloading coloredlogs-15.0.1-py2.py3-none-any.whl.metadata (12 kB)
Collecting flatbuffers (from onnxruntime-zhouyi==1.20.0)
  Downloading flatbuffers-25.9.23-py2.py3-none-any.whl.metadata (875 bytes)
Collecting numpy>=1.21.6 (from onnxruntime-zhouyi==1.20.0)
  Downloading numpy-2.3.5-cp311-cp311-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl.metadata (62 kB)
Collecting packaging (from onnxruntime-zhouyi==1.20.0)
  Downloading packaging-25.0-py3-none-any.whl.metadata (3.3 kB)
Collecting protobuf (from onnxruntime-zhouyi==1.20.0)
  Downloading protobuf-6.33.1-cp39-abi3-manylinux2014_aarch64.whl.metadata (593 bytes)
Collecting sympy (from onnxruntime-zhouyi==1.20.0)
  Downloading sympy-1.14.0-py3-none-any.whl.metadata (12 kB)
Collecting humanfriendly>=9.1 (from coloredlogs->onnxruntime-zhouyi==1.20.0)
  Downloading humanfriendly-10.0-py2.py3-none-any.whl.metadata (9.2 kB)
Collecting mpmath<1.4,>=1.1.0 (from sympy->onnxruntime-zhouyi==1.20.0)
  Downloading mpmath-1.3.0-py3-none-any.whl.metadata (8.6 kB)
Downloading numpy-2.3.5-cp311-cp311-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl (14.6 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 14.6/14.6 MB 27.4 MB/s  0:00:00
Downloading coloredlogs-15.0.1-py2.py3-none-any.whl (46 kB)
Downloading humanfriendly-10.0-py2.py3-none-any.whl (86 kB)
Downloading flatbuffers-25.9.23-py2.py3-none-any.whl (30 kB)
Downloading packaging-25.0-py3-none-any.whl (66 kB)
Downloading protobuf-6.33.1-cp39-abi3-manylinux2014_aarch64.whl (324 kB)
Downloading sympy-1.14.0-py3-none-any.whl (6.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 6.3/6.3 MB 29.1 MB/s  0:00:00
Downloading mpmath-1.3.0-py3-none-any.whl (536 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 536.2/536.2 kB 4.8 MB/s  0:00:00
Installing collected packages: mpmath, flatbuffers, sympy, protobuf, packaging, numpy, humanfriendly, coloredlogs, onnxruntime-zhouyi
  Attempting uninstall: mpmath
    Found existing installation: mpmath 1.3.0
    Uninstalling mpmath-1.3.0:
      Successfully uninstalled mpmath-1.3.0
  Attempting uninstall: flatbuffers
    Found existing installation: flatbuffers 25.9.23
    Uninstalling flatbuffers-25.9.23:
      Successfully uninstalled flatbuffers-25.9.23
  Attempting uninstall: sympy
    Found existing installation: sympy 1.14.0
    Uninstalling sympy-1.14.0:
      Successfully uninstalled sympy-1.14.0
  Attempting uninstall: protobuf
    Found existing installation: protobuf 6.33.1
    Uninstalling protobuf-6.33.1:
      Successfully uninstalled protobuf-6.33.1
  Attempting uninstall: packaging
    Found existing installation: packaging 25.0
    Uninstalling packaging-25.0:
      Successfully uninstalled packaging-25.0
  Attempting uninstall: numpy
    Found existing installation: numpy 1.26.0
    Uninstalling numpy-1.26.0:
      Successfully uninstalled numpy-1.26.0
  Attempting uninstall: humanfriendly
    Found existing installation: humanfriendly 10.0
    Uninstalling humanfriendly-10.0:
      Successfully uninstalled humanfriendly-10.0
  Attempting uninstall: coloredlogs
    Found existing installation: coloredlogs 15.0.1
    Uninstalling coloredlogs-15.0.1:
      Successfully uninstalled coloredlogs-15.0.1
Successfully installed coloredlogs-15.0.1 flatbuffers-25.9.23 humanfriendly-10.0 mpmath-1.3.0 numpy-2.3.5 onnxruntime-zhouyi-1.20.0 packaging-25.0 protobuf-6.33.1 sympy-1.14.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager, possibly rendering your system unusable. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv. Use the --root-user-action option if you know what you are doing and want to suppress this warning.
NPU Runtime installed.

[Step 4] Verifying NPU Driver Version
Driver found:
ii  cix-npu-onnxruntime                  1.1.0                               arm64        cix-npu-onnxruntime package
Manual recommends version 1.1.0 or higher.

[Step 5] Run Test Inference (ResNet50)
Run the ResNet50 image classification test on NPU? (y/n): y
Running inference_npu.py...
npu: noe_init_context success
npu: noe_load_graph success
Input tensor count is 1.
Output tensor count is 1.
npu: noe_create_job success
image path : test_data/ILSVRC2012_val_00045790.JPEG
Yorkshire terrier
image path : test_data/ILSVRC2012_val_00024154.JPEG
Ibizan hound, Ibizan Podenco
image path : test_data/ILSVRC2012_val_00037133.JPEG
ice bear, polar bear, Ursus Maritimus, Thalarctos maritimus
image path : test_data/ILSVRC2012_val_00002899.JPEG
rock python, rock snake, Python sebae
image path : test_data/ILSVRC2012_val_00021564.JPEG
coucal
npu: noe_clean_job success
npu: noe_unload_graph success
npu: noe_deinit_context success

If you see 'npu: noe_create_job success' above, the NPU is working!

Setup script complete.
