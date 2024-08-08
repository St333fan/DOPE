# DOPE (DetectiOn and Pose Estimation)

This repository serves as a central hub for multiple object detectors and pose estimators.

- PUT YCBV DATASET IN datasets
- smth regarding prepare templates stuff for zs6d
- smth regarding setup.sh for cnos

## Cloning the repository

To clone this repository with all its submodules:
```bash
git clone --recurse-submodules https://github.com/v4r-tuwien/dope.git
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
docker-compose -f docker_compose/gdrnpp_yolov8.yml up
```

### cnos and zs6d
Start the containers with the following command:
```bash
xhost local:docker
docker-compose -f docker_compose/cnos_zs6d.yml up
```