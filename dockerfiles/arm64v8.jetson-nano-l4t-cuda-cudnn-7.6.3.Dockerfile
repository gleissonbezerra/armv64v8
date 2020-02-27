FROM toolboc/jetson-nano-l4t-cuda

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.6.3.28

ENV CUDNN_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

ARG libcudnn7_URL=https://onedrive.live.com/download?cid=e0892e1fd9f533ff&resid=E0892E1FD9F533FF!408357&authkey=!AIjyNEbrnD4JDsk
ARG libcudnn7_dev_URL=https://onedrive.live.com/download?cid=e0892e1fd9f533ff&resid=E0892E1FD9F533FF!408358&authkey=!AL-GSCWHgIoMFwA
ARG libcudnn7_doc_URL=https://onedrive.live.com/download?cid=e0892e1fd9f533ff&resid=E0892E1FD9F533FF!408356&authkey=!AA8OiRz2GzxNz-c

RUN curl -sL $libcudnn7_URL -o libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    dpkg -i libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb

RUN curl -sL $libcudnn7_dev_URL -o libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    dpkg -i libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb

RUN curl -sL $libcudnn7_doc_URL -o libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    dpkg -i libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb

