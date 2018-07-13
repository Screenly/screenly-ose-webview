#!/bin/bash -x

sudo sed -i -e 's/#deb-src/deb-src/' /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y build-dep libqt5gui5
sudo apt-get -y build-dep qt4-x11
sudo apt-get -y install libudev-dev libinput-dev libts-dev libxcb-xinerama0-dev libxcb-xinerama0

QT_FOLDER_1=/home/pi/src/qt5/pi_1 # For pi 1 and pi zero
QT_FOLDER_2=/home/pi/src/qt5/pi_2 # For pi 2
QT_FOLDER_3=/home/pi/src/qt5/pi_3 # For pi 3

set -x

if [ ! -d "$QT_FOLDER_1" ]; then
  mkdir $QT_FOLDER_1
  cd $QT_FOLDER_1
  git clone git://code.qt.io/qt/qtbase.git -b 5.9
  cd qtbase
  ./configure -release -opengl es2 -device linux-rasp-pi-g++ -device-option CROSS_COMPILE=/usr/bin/ -opensource -confirm-license -release -make libs -prefix /usr/local/qt5pi -extprefix $QT_FOLDER_1/qt5pi -no-use-gold-linker
else
  cd $QT_FOLDER_1/qtbase
fi

make -j 4
make install
cp -r /usr/share/fonts/truetype/dejavu/ $QT_FOLDER_1/qt5pi/lib/fonts
cd $QT_FOLDER_1
tar -zcvf /home/pi/qtbase-pi1.tar.gz qt5pi
cd /home/pi
echo $(md5sum qtbase-pi1.tar.gz) > qtbase-pi1.tar.gz.md5


if [ ! -d "$QT_FOLDER_2" ]; then
  mkdir $QT_FOLDER_2
  cd $QT_FOLDER_2
  git clone git://code.qt.io/qt/qtbase.git -b 5.9
  cd qtbase
  ./configure -release -opengl es2 -device linux-rasp-pi2-g++ -device-option CROSS_COMPILE=/usr/bin/ -opensource -confirm-license -release -make libs -prefix /usr/local/qt5pi -extprefix $QT_FOLDER_2/qt5pi -no-use-gold-linker
else
  cd $QT_FOLDER_2/qtbase
fi

make -j 4
make install
cp -r /usr/share/fonts/truetype/dejavu/ $QT_FOLDER_2/qt5pi/lib/fonts
cd $QT_FOLDER_2
tar -zcvf /home/pi/qtbase-pi2.tar.gz qt5pi
cd /home/pi
echo $(md5sum qtbase-pi2.tar.gz) > qtbase-pi2.tar.gz.md5


if [ ! -d "$QT_FOLDER_3" ]; then
  mkdir $QT_FOLDER_3
  cd $QT_FOLDER_3
  git clone git://code.qt.io/qt/qtbase.git -b 5.9
  cd qtbase
  ./configure -release -opengl es2 -device linux-rasp-pi3-g++ -device-option CROSS_COMPILE=/usr/bin/ -opensource -confirm-license -release -make libs -prefix /usr/local/qt5pi -extprefix $QT_FOLDER_3/qt5pi -no-use-gold-linker
else
  cd $QT_FOLDER_3/qtbase
fi

make -j 4
make install
cp -r /usr/share/fonts/truetype/dejavu/ $QT_FOLDER_3/qt5pi/lib/fonts
cd $QT_FOLDER_3
tar -zcvf /home/pi/qtbase-pi3.tar.gz qt5pi
cd /home/pi
echo $(md5sum qtbase-pi3.tar.gz) > qtbase-pi3.tar.gz.md5
