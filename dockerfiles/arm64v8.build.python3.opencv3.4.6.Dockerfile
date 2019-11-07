FROM arm64v8/ubuntu

ARG folder=/src
RUN mkdir -p $folder

RUN apt-get update && \
    apt-get install -y --no-install-recommends libpython3-dev && \
    rm -rf /var/lib/apt/lists/* 

RUN apt-get update
RUN apt-get install -y build-essential make cmake cmake-curses-gui git g++ pkg-config curl
RUN apt-get install -y libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libeigen3-dev libglew-dev libgtk2.0-dev
RUN apt-get install -y libtbb2 libtbb-dev libv4l-dev v4l-utils qv4l2 v4l2ucp
RUN apt-get install -y libdc1394-22-dev libxine2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
# RUN apt-get install -y libjasper-dev
RUN apt-get install -y libjpeg8-dev libjpeg-turbo8-dev libtiff-dev libpng-dev
RUN apt-get install -y libxvidcore-dev libx264-dev libgtk-3-dev
RUN apt-get install -y libatlas-base-dev libopenblas-dev liblapack-dev liblapacke-dev gfortran
RUN apt-get install -y qt5-default

RUN apt-get update
RUN apt-get install -y python3.6-dev python3-testresources
RUN rm -f $folder/get-pip.py
RUN apt install -y wget
RUN wget https://bootstrap.pypa.io/get-pip.py -O $folder/get-pip.py
RUN python3 $folder/get-pip.py
RUN pip3 install protobuf
RUN pip3 install -U numpy matplotlib

WORKDIR $folder

RUN wget https://github.com/opencv/opencv/archive/3.4.6.zip -O opencv-3.4.6.zip

RUN apt-get install -y zip
RUN apt-get install -y unzip

RUN unzip opencv-3.4.6.zip 

WORKDIR $folder/opencv-3.4.6

RUN mkdir build

WORKDIR $folder/opencv-3.4.6/build

RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ENABLE_NEON=ON -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python3=ON -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D WITH_QT=ON -D WITH_OPENGL=ON ..
RUN make -j3
RUN make install
RUN ldconfig

RUN python3 -c 'import cv2; print("python3 cv2 version: %s" % cv2.__version__)'


