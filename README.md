# Screenly OSE WebView

## Building

You can build the release locally by running:



To prepare for a release, use the docker container:

```
$ docker buildx build \
    --platform linux/arm/v7 \
    -t screenly/screenly-webview-build .
```

```
$ docker run --rm \
    -e VERSION=*version* \
    -v $(pwd):/Screenly-webview \
    screenly/screenly-webview-build
```

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
