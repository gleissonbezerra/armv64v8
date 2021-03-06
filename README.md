# armv64v8

This repository contains some lessons learned about Docker Containers on ARM64v8 architeture.

Some of them are related to Microsoft Azure IoT Edge, IoT Hub SDK, CUDA, CUDNN and Python.

See https://github.com/gleissonbezerra/armv64v8/tree/master/dockerfiles folder to know about creating images or check my dockerhub https://hub.docker.com/u/gleissonbezerra to download some of them.

# Build an ARM64v8 version of Azure IoT Hub Python SDK (v1 only)

1. Download and build https://github.com/gleissonbezerra/armv64v8/blob/master/dockerfiles/arm64v8.build.python3.iothubsdkv1.Dockerfile

# Use an ARM64v8 compiled version of Azure IoT Hub Python SDK (v1 only)

2. Download and build https://github.com/gleissonbezerra/armv64v8/blob/master/dockerfiles/arm64v8.basemodule.python3.iothubsdkv1.Dockerfile

# Create a Docker Image that Downloads and Install CUDNN libraries for NVidia Jetson Nano

1. Download and build https://github.com/gleissonbezerra/armv64v8/blob/master/dockerfiles/arm64v8.jetson-nano-l4t-cuda-cudnn-7.6.3.Dockerfile

# Create a Docker Image that Compiles CUDNN/GSTreamer Enabled version of OpenCV 4.2.0 for NVidia Jetson Nano

1. Download and build https://github.com/gleissonbezerra/armv64v8/blob/master/dockerfiles/arm64v8.jetson-nano-l4t-cuda-cudnn-opencv-4.2.0.Dockerfile

# Use a compiled CUDNN/GStreamer Enabled version of OpenCV 4.2.0 on NVidia Jetson Nano

1. docker pull gleissonbezerra/jetson-nano-l4t-cuda-cudnn-opencv-4.2.0:1.0.0-arm64v8
2. Follow that steps on https://www.pyimagesearch.com/2020/02/10/opencv-dnn-with-nvidia-gpus-1549-faster-yolo-ssd-and-mask-r-cnn/

