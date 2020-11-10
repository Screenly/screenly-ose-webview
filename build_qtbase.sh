#!/bin/bash -ex

QT_PI_1=/src/qt5/pi_1 # For Pi 1 and Pi zero
QT_PI_2=/src/qt5/pi_2 # For Pi 2
QT_PI_3=/src/qt5/pi_3 # For Pi 3
QT_PI_4=/src/qt5/pi_4 # For Pi 4
BUILD_TARGET=/build
QT_BRANCH="5.9"

mkdir -p "$BUILD_TARGET"

if [ ! -d "$QT_PI_1" ]; then
  mkdir -p "$QT_PI_1"
  cd "$QT_PI_1"
  git clone git://code.qt.io/qt/qtbase.git -b "$QT_BRANCH"
  cd qtbase
  ./configure \
      -release \
      -opengl es2 \
      -device linux-rasp-pi-g++ \
      -device-option CROSS_COMPILE=/usr/bin/ \
      -opensource -confirm-license \
      -make libs \
      -prefix /usr/local/qt5pi \
      -extprefix $QT_PI_1/qt5pi \
      -no-use-gold-linker
fi

make -j "$(nproc --all)"
make install
cp -r /usr/share/fonts/truetype/dejavu/ "$QT_PI_1/qt5pi/lib/fonts"
cd "$QT_PI_1"
tar -zcvf $BUILD_TARGET/qtbase-pi1.tar.gz qt5pi
cd "$BUILD_TARGET"
md5sum qtbase-pi1.tar.gz > qtbase-pi1.tar.gz.md5


if [ ! -d "$QT_PI_2" ]; then
  mkdir -p "$QT_PI_2"
  cd "$QT_PI_2"
  git clone git://code.qt.io/qt/qtbase.git -b "$QT_BRANCH"
  cd qtbase
  ./configure \
      -release \
      -opengl es2 \
      -device linux-rasp-pi2-g++ -\
      device-option CROSS_COMPILE=/usr/bin/ \
      -opensource \
      -confirm-license \
      -make libs \
      -prefix /usr/local/qt5pi \
      -extprefix "$QT_PI_2/qt5pi" \
      -no-use-gold-linker
fi

make -j "$(nproc --all)"
make install
cp -r /usr/share/fonts/truetype/dejavu/ "$QT_PI_2/qt5pi/lib/fonts"
cd "$QT_PI_2"
tar -zcvf "$BUILD_TARGET/qtbase-pi2.tar.gz" qt5pi
cd "$BUILD_TARGET"
md5sum qtbase-pi2.tar.gz > qtbase-pi2.tar.gz.md5


if [ ! -d "$QT_PI_3" ]; then
  mkdir -p $QT_PI_3
  cd "$QT_PI_3"
  git clone git://code.qt.io/qt/qtbase.git -b "$QT_BRANCH"
  cd qtbase
  ./configure \
      -release \
      -opengl es2 \
      -device linux-rasp-pi3-g++ \
      -device-option CROSS_COMPILE=/usr/bin/ \
      -opensource \
      -confirm-license \
      -release \
      -make libs \
      -prefix /usr/local/qt5pi \
      -extprefix "$QT_PI_3/qt5pi" \
      -no-use-gold-linker
fi

make -j "$(nproc --all)"
make install
cp -r /usr/share/fonts/truetype/dejavu/ "$QT_PI_3/qt5pi/lib/fonts"
cd "$QT_PI_3"
tar -zcvf "$BUILD_TARGET/qtbase-pi3.tar.gz" qt5pi
cd "$BUILD_TARGET"
md5sum qtbase-pi3.tar.gz > qtbase-pi3.tar.gz.md5
