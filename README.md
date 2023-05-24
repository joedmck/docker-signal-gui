# Signal Desktop Application - Docker image

![CI/CD Status](https://img.shields.io/github/actions/workflow/status/joedmck/docker-signal-gui/build-on-push.yml)

_Unofficial_ Docker image for the [Signal](https://www.signal.org) messaging desktop app, using the [jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui) image. Once deployed, the app can be accessed through a modern web browser or a VNC client.

## Getting started

### From Image Registry

```bash
docker volume create --name=signal-data
docker run -d --name=signal -p 5800:5800 -p 5900:5900 -v signal-data:/config -v /etc/localtime:/etc/localtime:ro ghcr.io/joedmck/docker-signal-gui:main
```

### From Source

```bash
git clone https://github.com/joedmck/docker-signal-gui.git && cd docker-signal-gui
docker build -t signal:latest .
docker volume create --name=signal-data
docker run -d --name=signal -p 5800:5800 -p 5900:5900 -v signal-data:/config -v /etc/localtime:/etc/localtime:ro signal:latest
```

Access browser VNC client at http://localhost:5800 or connect using a VNC client to localhost:5900.

## Configuration

See documentation of base image for configuration options (e.g., VNC security): https://github.com/jlesage/docker-baseimage-gui
