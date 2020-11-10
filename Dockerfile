FROM balenalib/rpi-raspbian:buster

RUN sed -i -e 's/#deb-src/deb-src/' /etc/apt/sources.list
RUN apt-get update && \
    apt-get -y install \
        build-essential \
        g++ \
        git \
        libinput-dev \
        libqt5gui5 \
        libqt5webkit5-dev \
        libqt5x11extras5-dev \
        libts-dev \
        libudev-dev \
        libxcb-xinerama0 \
        libxcb-xinerama0-dev \
        make && \
    apt-get clean

WORKDIR /build

RUN mkdir /src
COPY build_qtbase.sh /usr/local/bin/
COPY build.sh /usr/local/bin/
COPY . /src

RUN build_qtbase.sh
RUN build.sh
