#!/bin/bash

/usr/lib/arm-linux-gnueabihf/qt5/bin/qmake
make
make install
tar -zcvf "screenly-webview-${VERSION}.tar.gz" res ScreenlyWebview
