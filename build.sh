#!/bin/bash

/usr/lib/arm-linux-gnueabihf/qt5/bin/qmake
make
make install
tar -zcvf "screenly-webview-v${VERSION}.tar.gz" res ScreenlyWebview
