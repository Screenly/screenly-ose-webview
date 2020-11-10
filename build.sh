#!/bin/bash -ex

cd /src
/usr/lib/arm-linux-gnueabihf/qt5/bin/qmake
make -j "$(nproc --all)"
make install

tar -zcvf "/build/screenly-webview.tar.gz" res ScreenlyWebview
