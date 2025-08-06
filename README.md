# DOPE (DetectiOn and Pose Estimation)

This repository serves as a central hub for multiple object detectors and pose estimators.

- PUT YCBV DATASET IN datasets
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

# no ZS6D
## render templates or copy them into the correct folder, my adapt docker-compose or dockerfile
xhost local:docker
docker-compose -f docker_compose/cnos.yml up
```

### FoundationPose
Start the containers with the following command:
```bash
xhost local:docker
docker-compose -f docker_compose/foundationpose.yml up
```
