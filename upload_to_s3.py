import boto3
import tarfile
import os.path

def make_tarfile(output_filename, source_dir):
    with tarfile.open(output_filename, "w:gz") as tar:
        tar.add(source_dir, arcname=os.path.basename(source_dir))

if __name__ == "__main__":
    AWS_S3_USER = ""
    AWS_S3_PASS = ""
    AWS_S3_BUCKET = ""

    s3 = boto3.client("s3",
                    aws_access_key_id=AWS_S3_USER,
                    aws_secret_access_key=AWS_S3_PASS,
                    region_name='us-east-1')
    
    # Compress models
    make_tarfile("car_truck_yolo.tar.gz", "./checkpoints/yolo-car-test")
    make_tarfile("lpr_yolo.tar.gz", "./checkpoints/yolo-lpr-test")
    
    # Upload models to S3

    s3.upload_file("lpr_yolo.tar.gz", AWS_S3_BUCKET,
                   "lpr_yolo.tar.gz")
    s3.upload_file("car_truck_yolo.tar.gz", AWS_S3_BUCKET,
                   "car_truck_yolo.tar.gz")
