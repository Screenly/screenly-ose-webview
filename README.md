# Screenly OSE WebView

## Building

The build process depends on cross compiling on Docker. You may need to enable the `buildx` functionality.

Build the docker container:
```
$ docker buildx build \
    --platform linux/arm/v6,linux/arm/v7 \
    --load \
    -t screenly/screenly-webview-build \
    -f Dockerfile .
```

Build the actual web view
```
$ docker run --rm \
    -v $(pwd):/build \
    screenly/screenly-webview-build
    build.sh
```

Build out the QT Base
```
$ docker run --rm \
    -v $(pwd):/build \
    screenly/screenly-webview-build
    build_qtbase.sh
```

Note that this is done automatically on GitHub Actions, so there is usually no need to build this locally.

## Usage

DBus is used for communication.
Webview registers `screenly.webview` object at `/Screenly` address on the session bus.

Webview provides 2 methods:`loadPage` and `loadImage`.

Example of interaction (python):

```
from pydbus import SessionBus

bus = SessionBus()
browser_bus = bus.get('screenly.webview', '/Screenly')

browser_bus.loadPage("www.example.com")
```

Supported protocols: `http://`, `https://`
