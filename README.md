# armv64v8

This repository contains some lessons learned about Microsoft Azure IoT Edge, IoT Hub SDK, Dockerfiles and Python regarding ARM64 architecture.

See /dockerfiles folder to know about creating images or check my dockerhub https://hub.docker.com/u/gleissonbezerra to download some of them.

To get Azure IoT Edge Running on:

# NVidia Jetson Nano

1. Download the OS image from https://developer.nvidia.com/jetson-nano-sd-card-image-r322
2. Follow the instructions from https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#write
3. Once you have the OS running, if you want to connect your device to WiFi and depending on your adapter, you may need to do this:
    - sudo iw dev wlan0 set power_save off
    - echo "blacklist rtl8192cu" | sudo tee -a /etc/modprobe.d/blacklist.conf
4. Follow the steps on https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux

# Raspberry 4

Comming soon...