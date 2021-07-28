# Run training car_truck

./darknet/darknet detector train ./data/car_truck.data ./data/yolov4-car_truck.cfg -map -dont_show

# run training lpr

./darknet/darknet detector train ./data/lpr.data ./data/yolov4-lpr.cfg -map -dont_show

# convert to yolo model
cd yolov4

echo "License Plate" > data/classes/coco.names 

python3 save_model.py --weights ../darknet/backup_lpr/yolov4-lpr_best.weights --output ../checkpoints/yolo-lpr-test --input_size 416 --model yolov4

echo "Car
Truck" > data/classes/coco.names

python3 save_model.py --weights ../darknet/backup_car/yolov4-car_truck_best.weights --output ../checkpoints/yolo-car-test --input_size 416 --model yolov4

cd ..

# Uploading best_weights to S3 via overwrite methode with python3
python3 upload_to_s3.py