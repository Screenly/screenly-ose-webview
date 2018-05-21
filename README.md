# ScreenlyOSE-WebView

## Building

Before building, you need to install the following packages:

```
libqt5webkit5-dev
gstreamer0.10-plugins-good
libdbus-glib-1-dev
```

Building:

```
qmake
make
make install
```

You can change the folder to build:

```
export PREFIX=/home/pi/webview_build/
```

Besides, you need to copy `res` folder to `/usr/local/bin/ScreenlyWebview/res`

## Usage

DBus is used for communication.
Webview registers `screenly.webvew` object at `/Screenly` address on the session bus.

Webview provides 2 methods:`loadPage` and `loadImage`.

Example of interaction (python):

```
from pydbus import SessionBus

bus = SessionBus()
browser_bus = bus.get('screenly.webview', '/Screenly')

browser_bus.loadPage("www.example.com")
```

Supported protocols: `http://`, `https://`