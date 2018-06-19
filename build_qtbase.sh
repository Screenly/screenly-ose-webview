#!/bin/bash -x

sudo sed -i -e 's/#deb-src/deb-src/' /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y build-dep libqt5gui5
sudo apt-get -y build-dep qt4-x11
sudo apt-get -y install libudev-dev libinput-dev libts-dev libxcb-xinerama0-dev libxcb-xinerama0

QT_FOLDER=/home/pi/src/qt5

if [ ! -d "$QT_FOLDER" ]; then
  mkdir $QT_FOLDER
  cd $QT_FOLDER
  git clone git://code.qt.io/qt/qtbase.git -b 5.9
  cd qtbase
  ./configure -release -opengl es2 -device linux-rasp-pi3-g++ -device-option CROSS_COMPILE=/usr/bin/ -opensource -confirm-license -release -make libs -prefix /usr/local/qt5pi -extprefix $QT_FOLDER/qt5pi -no-use-gold-linker
else
  cd $QT_FOLDER/qtbase
fi

make -j 4
make install
cp -r /usr/share/fonts/truetype/dejavu/ $QT_FOLDER/qt5pi/lib/fonts
cd $QT_FOLDER
tar -zcvf /home/pi/qtbase.tar.gz qt5pi
