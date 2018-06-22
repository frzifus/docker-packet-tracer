IMAGE=packettracer

all:
	@echo "make build:  creates a docker image (${IMAGE})"
	@echo "make run:    starts packettracer"
	@echo "make shell:  opens a shell in the container"

build:
	docker build -t ${IMAGE} .

run:
	docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ${IMAGE}

shell:
	docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ${IMAGE} /bin/bash

clean:
	docker rmi ${IMAGE}
