#!/bin/bash

# vim: tabstop=4 shiftwidth=4 softtabstop=4
# -*- sh-basic-offset: 4 -*-

# Only build on ARMv7
if [ "$(arch)" = "armv7l" ]; then

    cd /src
    /usr/lib/arm-linux-gnueabihf/qt5/bin/qmake
    make -j "$(nproc --all)"
    make install

    tar -zcvf "/build/screenly-webview.tar.gz" res ScreenlyWebview
fi
