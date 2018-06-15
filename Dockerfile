FROM resin/rpi-raspbian:stretch
MAINTAINER Anton Molodykh <amolodykh@screenly.io>

RUN apt-get update && \
    apt-get -y install \
        build-essential \
        g++ \
        libqt5webkit5-dev \
        make && \
    apt-get clean

WORKDIR /Screenly-webview

CMD ["bash", "build.sh"]

