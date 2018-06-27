# Packet tracer in a container

### Description
-------
docker-pt is a container for cisco's packet tracer program. Packet tracer is automatically installed in a container and can be conveniently used from there.
Prerequisite is an XServer, which is provided to the container as a volume. Furthermore a current installation of docker.

### Build
**1. Get the repository**
#### https
```https
git clone https://github.com:frzifus/docker-pt.git
```

**2. Navigate to the repo**
```bash
make build   # creates a docker image (packettracer)
make run     # starts packettracer
make shell   # opens a shell in the container
make clean   # removes packettracer image

```

### Troubleshooting
If you receive an error like
```
QXcbConnection: Could not connect to display
```
your docker daemon isn't authorized to use your local XServer session. Fix:
```
xhost +local:docker
```

### TODO
-------
- Build a flatpak
