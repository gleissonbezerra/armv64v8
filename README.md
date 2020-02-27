# armv64v8

This repository contains some lessons learned about Docker Containers on ARM64v8 architeture.

Some of them are related to Microsoft Azure IoT Edge, IoT Hub SDK, CUDA, CUDNN and Python.

See https://github.com/gleissonbezerra/armv64v8/tree/master/dockerfiles folder to know about creating images or check my dockerhub https://hub.docker.com/u/gleissonbezerra to download some of them.

# Microsoft Azure IoT Edge on NVidia Jetson Nano 

1. Download the OS image from https://developer.nvidia.com/jetson-nano-sd-card-image-r322
2. Follow the instructions from https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#write
3. Once you have the OS running, if you want to connect your device to WiFi and depending on your adapter, you may need to do this:
    - sudo iw dev wlan0 set power_save off
    - echo "blacklist rtl8192cu" | sudo tee -a /etc/modprobe.d/blacklist.conf
4. Follow the steps on https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux

# To build an ARM64v8 version of Microsoft Azure IoT Hub Python SDK (v1 only)

1. Download and build https://github.com/gleissonbezerra/armv64v8/blob/master/dockerfiles/arm64v8.build.python3.iothubsdkv1.Dockerfile

# To use an ARM64v8 compiled version of Microsoft Azure IoT Hub Python SDK (v1 only)

2. Download and build https://github.com/gleissonbezerra/armv64v8/blob/master/dockerfiles/arm64v8.basemodule.python3.iothubsdkv1.Dockerfile

