FROM gleissonbezerra/python3iothubsdkv1:0.0.1-arm64v8

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends libpython3-dev && \
    rm -rf /var/lib/apt/lists/* 

RUN pip3 install --upgrade pip 
RUN pip install --upgrade setuptools 

COPY . .

RUN cp /usr/sdk/src/c/cmake/iotsdk_linux/python/src/iothub_client.so ./iothub_client.so

RUN useradd -ms /bin/bash moduleuser
USER moduleuser

ENTRYPOINT [ "python3", "-u", "./main.py" ]