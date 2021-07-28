git clone https://github.com/AlexeyAB/darknet.git
git clone https://github.com/hunglc007/tensorflow-yolov4-tflite.git
mv tensorflow-yolov4-tflite yolov4

rm -rf darknet/.git

cd darknet/
mkdir backup_car
mkdir backup_lpr

# Grabbing Dataset
wget https://plaquecv.s3.amazonaws.com/Dataset_for_Darknet.tar.xz

# Extract model to data folder
cd data
rm -rf *
git clone https://github.com/Noobzik/plaquecv_models.git .
rm -rf .git
tar -xf ../Dataset_for_Darknet.tar.xz -C ./

# Grab Model configuration


# Deleting Downloaded database (clearing space)
cd ..
rm -rf Dataset_for_Darknet.tar.xz 

# move Start Inference.py to darknet folder

echo  "USER STEP NEEDED !"
printf "You need to edit the Makefile\n\n"
echo "Please use the following value (first 3 lines):"
printf "*\tGPU\t\t= 1\n"
printf "*\tCUDNN\t= 1\n"
printf "*\tOPENCV\t= 1\n"
printf "then run \`make\` on the terminal to compile darknet\n"