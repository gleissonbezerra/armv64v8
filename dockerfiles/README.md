# basemodule.python3.Dockerfile

This file contains all steps to compile IoT Hub SDK python version for ARM64v8.

It was based on the original version from https://github.com/Azure/azure-iot-sdk-python/blob/master/dockerfiles/Dockerfile_Linux.build.arm64v8_xenial removing VIRTUAL-ENV and Pyhton 2 version (it's commented out there). With that, it was able to have a new image with IoT HUB SDK .so files generated according to architecure.

You you don't want to build the image, just download it from my docker hub repository (gleissonbezerra/basemodule:0.0.2-arm64v8).

If you decide to build it, just make sure you have cloned the PYTHON C repository using the following command:

git clone --recursive https://github.com/Azure/azure-iot-sdk-python.git

and, follow the instructions from https://github.com/Azure/azure-iot-sdk-python/blob/master/dockerfiles/readme.md

Regardless if you download it or build it, the IoT Hub SDK .SO files will be at /usr/sdk/src/c/cmake/iotsdk_linux/python/src/iothub_client.so and you have to copy it to root or path of your app inside the container.

# arm64v8.python3.Dockerfile

This file contains all steps to download the gleissonbezerra/basemodule:0.0.2-arm64v8 base image and put your Azure IoT EDGE Module Python 3 application running using Azure IoT HUB SDK on ARM64v8.


