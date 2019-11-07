FROM arm64v8/buildpack-deps:xenial-scm as build

# Update image
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y cmake build-essential curl libcurl4-openssl-dev \
    libssl-dev uuid-dev apt-utils python python-pip python-virtualenv python3 python3-pip python3-virtualenv \
    libboost-python-dev pkg-config valgrind sudo

#RUN python -m virtualenv --python=python3 env3
#RUN source env3/bin/activate && 
RUN pip install --upgrade pip
RUN pip install -U setuptools wheel

WORKDIR /usr/sdk

# Copy code (this assumes the ./src folder contains the recursively cloned SDK repository (azure/azure-iot-sdk-python))
COPY ./src ./src

# Build for Python 3
RUN ./src/build_all/linux/setup.sh --python-version 3.5
RUN ./src/build_all/linux/release.sh --build-python 3.5

