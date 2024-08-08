gdrnpp_weights_dir=./pose_estimators/gdrnpp_sasha/output/gdrn/
gdrnpp_models_dir=./pose_estimators/gdrnpp_sasha/datasets/BOP_DATASETS/
yolo_weights_dir=./object_detectors/yolov8_sasha


wget -O gdrnpp_ycbv_weights.zip "https://owncloud.tuwien.ac.at/index.php/s/fkCygRgrV9C7zDH/download"
unzip gdrnpp_ycbv_weights.zip
mkdir -p $gdrnpp_weights_dir/ycbv/
cp -r gdrnpp_ycbv_weights.pth $gdrnpp_weights_dir/ycbv/gdrnpp_ycbv_weights.pth
rm -r gdrnpp_ycbv_weights.zip gdrnpp_ycbv_weights.pth

wget -O gdrnpp_ycbv_models.zip "https://owncloud.tuwien.ac.at/index.php/s/gUxThY2caSsvix2/download"
unzip gdrnpp_ycbv_models.zip
mkdir -p $gdrnpp_models_dir/ycbv
cp -r models $gdrnpp_models_dir/ycbv
rm -r gdrnpp_ycbv_models.zip models

# # Ycb ichores weights and models
wget -O ycb_ichores.zip "https://owncloud.tuwien.ac.at/index.php/s/qTajYeAhCghzRl3/download"
unzip ycb_ichores.zip

unzip ycb_ichores/yolov8_weights/ycb_ichores.zip
cp -r train10/weights/last.pt $yolo_weights_dir/ycb_ichores_weights.pt
rm -r train10 ycb_ichores/yolov8_weights

mkdir -p $gdrnpp_weights_dir/ycb_ichores
cp -r ycb_ichores/gdrn_weight/model_final.pth $gdrnpp_weights_dir/ycb_ichores/gdrnpp_ycb_ichores_weights.pth
rm -r ycb_ichores/gdrn_weight 

mkdir -p $gdrnpp_models_dir/ycb_ichores
cp -r ycb_ichores/models $gdrnpp_models_dir/ycb_ichores
rm -r ycb_ichores.zip ycb_ichores