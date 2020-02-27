FROM gleissonbezerra/jetson-nano-l4t-cuda-cudnn-7.6.3:1.0.0-arm64v8

#Required for libjasper-dev
RUN echo "deb http://ports.ubuntu.com/ubuntu-ports/ xenial-security main restricted" | sudo tee -a /etc/apt/sources.list

#INSTALL OPENCV dependencies

RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get install -y build-essential cmake unzip pkg-config
RUN apt-get install -y libjpeg-dev libpng-dev libtiff-dev
RUN apt-get install -y libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get install -y libv4l-dev libxvidcore-dev libx264-dev
RUN apt-get install -y libgtk-3-dev
RUN apt-get install -y libatlas-base-dev gfortran
RUN apt-get install -y wget

RUN apt install -y git libgtk2.0-dev \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
    python3.6-dev python3-numpy \
    libtbb2 libtbb-dev libtiff-dev libjasper-dev libdc1394-22-dev \
    v4l-utils qv4l2 v4l2ucp \
    curl unzip && \
    rm -rf /var/lib/apt/lists/*


#GET OPENCV sources
RUN cd ~
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.2.0.zip
RUN wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.2.0.zip
RUN unzip opencv.zip
RUN unzip opencv_contrib.zip
RUN mv opencv-4.2.0 opencv
RUN mv opencv_contrib-4.2.0 opencv_contrib

#INSTALL PIP
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN sudo python3 get-pip.py

#BUILD AND INSTALL OPENCV
RUN pip3 install numpy

RUN cd /opencv
RUN mkdir build
RUN cd build

WORKDIR /opencv/build

RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_PYTHON_EXAMPLES=OFF \
	-D INSTALL_C_EXAMPLES=OFF \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D WITH_CUDA=ON \
	-D WITH_CUDNN=ON \
	-D OPENCV_DNN_CUDA=ON \
	-D ENABLE_FAST_MATH=1 \
	-D CUDA_FAST_MATH=1 \
	-D CUDA_ARCH_BIN=5.3 \
	-D WITH_CUBLAS=1 \
	-D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
	-D HAVE_opencv_python3=ON \
	-D PYTHON_EXECUTABLE=/bin/python \
	-D BUILD_EXAMPLES=OFF ..

RUN make -j5

RUN sudo make install
RUN sudo ldconfig

WORKDIR /usr/local/lib/python3.6/dist-packages/
RUN ln -s /usr/local/lib/python3.6/dist-packages/cv2/python-3.6/cv2.cpython-36m-aarch64-linux-gnu.so

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends libcurl4-openssl-dev gstreamer1.0-tools gstreamer1.0-alsa gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev &&\
    rm -rf /var/lib/apt/lists/* 
