# DOPE (DetectiOn and Pose Estimation)

This repository serves as a central hub for multiple object detectors and pose estimators.

- PUT YCBV DATASET IN datasets https://huggingface.co/datasets/bop-benchmark/ycbv/resolve/main/ycbv_models.zip
- smth regarding prepare templates stuff for zs6d
- smth regarding setup.sh for cnos

Change in ros.env the correct $ROS_IP

## Cloning the repository

To clone this repository with all its submodules:
```bash
git clone --recurse-submodules git@github.com:St333fan/DOPE.git
```

If you have already cloned the repository without the submodules, you can initialize and update them with:
```bash
git submodule update --init --recursive
```

## Downloading model weights
### yolov8 and gdrnpp
You can download the pretrained model weights with the following command:
```bash
bash scripts/download_ycbv_gdrnpp_weights.sh
```

## Building and running the containers
### yolov8 and gdrnpp
Start the containers with the following command:
```bash
xhost local:docker
DATASET=ycbv CONFIG=params_sasha.yaml docker-compose -f docker_compose/gdrnpp_yolov8.yml up
```
For YCB-ichores:
```bash
xhost local:docker
DATASET=ycb_ichores CONFIG=params_sasha.yaml docker-compose -f docker_compose/gdrnpp_yolov8.yml up
```

To test Gdr-net:
```bash
xhost local:docker
DATASET=ycbv CONFIG=params_sasha.yaml docker-compose -f docker_compose/gdrnpp_yolov8_test.yml up
```

### cnos and zs6d
Start the containers with the following command:
```bash
xhost local:docker
docker-compose -f docker_compose/cnos_zs6d.yml up

# without ZS6D
## render templates or copy them into the correct folder, my adapt docker-compose or dockerfile
xhost local:docker
docker-compose -f docker_compose/cnos.yml up
```

### FoundationPose
Go to submodule FoundationPose and download the weights, how to is descriped there

Start the containers with the following command:
```bash
xhost local:docker
docker-compose -f docker_compose/foundationpose.yml up
# when ended with problem
docker-compose -f docker_compose/foundationpose.yml down


# if run in new window for testing
docker exec -it docker_compose_foundationpose_1 bash
source /opt/ros/noetic/setup.bash
source /root/catkin_ws/devel/setup.bash
python foundationpose_ros_wrapper.py
```

### SAM-6D
First setup of git and running of docker-compose will take some time; At first startup it downloads model weights. Objects and templates needs manual download:
ycb-v models -> https://huggingface.co/datasets/bop-benchmark/ycbv/resolve/main/ycbv_models.zip

ycb-v templates SAM-6D -> https://drive.google.com/drive/folders/1fXt5Z6YDPZTJICZcywBUhu5rWnPvYAPI

```bash
├── datasets # create folder in DOPE folder
│   └── ycbv
│       ├── models # .ply and .png ycb-b models
│       └── templates
│           ├── obj_000001 # templates rendered like described in SAM-6D original git
│           ├── obj_000002
│           ├── ---
```

Start the containers with the following command:
```bash
xhost local:docker
docker-compose -f docker_compose/sam6d.yml up
# when ended with problem
docker-compose -f docker_compose/sam6d.yml down

# if run in new window for testing
docker exec -it docker_compose_sam6d_1 bash
source /opt/ros/noetic/setup.bash
source /root/catkin_ws/devel/setup.bash
# run Service
cd /code/Instance_Segmentation_Model/
python3 sam6DISM_ros_wrapper.py
```
