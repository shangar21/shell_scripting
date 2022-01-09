#!/bin/bash

cd ~/Documents

git clone https://github.com/xinntao/Real-ESRGAN.git

cd /media/ssm/storage || (mkdir /media/ssm/storage && cd /media/ssm/storage)

wget http://data.vision.ee.ethz.ch/cvl/DIV2K/DIV2K_train_HR.zip
curl https://cv.snu.ac.kr/research/EDSR/Flickr2K.tar -o Flickr2K.tar
wget https://openmmlab.oss-cn-hangzhou.aliyuncs.com/datasets/OST_dataset.zip

find . -name "*.zip" | xargs -P 5 -I fileName sh -c 'unzip -o -d "$(dirname "fileName")/$(basename -s .zip "fileName")" "fileName"'

tar -xvf Flickr2K.tar

mkdir DF2K

mkdir DF2K/DF2K_HR/

for f in $(find . -type f -name "*.png")
do
        mv $f DF2K/DF2K_HR/
done

cd ~/Documents/Real-ESRGAN

python3 scripts/generate_multiscale_DF2K.py --input /media/ssm/storage/DF2K/DF2K_HR --output /media/ssm/storage/DF2K/DF2K_multiscale

python3 scripts/generate_meta_info.py --input /media/ssm/storage/DF2K/DF2K_multiscale, /media/ssm/storage/DF2K/DF2K_HR --root /media/ssm/storage/DF2K, /media/ssm/storage/DF2k --meta_info /media/ssm/storage/DF2K/meta_info/meta_info_df2Kmultiscale.txt

wget https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.1/ESRGAN_SRx4_DF2KOST_official-ff704c30.pth -P experiments/pretrained_models

sed -i 's#datasets/DF2K/meta_info/meta_info_DF2Kmultiscale+OST_sub.txt#/media/ssm/storage/DF2K/meta_info/meta_info_DF2Kmultiscale.txt#g' options/train_realesrnet_x4plus.yml

