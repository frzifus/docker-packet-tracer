WORKDIR=$(shell pwd)
IMAGE=packettracer
STORAGE=storage

all:
	@echo "make build:  creates a docker image (${IMAGE})"
	@echo "make run:    starts packettracer"
	@echo "make shell:  opens a shell in the container"

build:
	docker build -t ${IMAGE} .

run:
	@mkdir -p ${STORAGE}
	@docker run -ti --rm -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix -v ${WORKDIR}/${STORAGE}:/home/pt/storage ${IMAGE}

shell:
	@mkdir -p ${STORAGE}
	@docker run -ti --rm -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix -v ${WORKDIR}/${STORAGE}:/home/pt/storage ${IMAGE} /bin/bash

clean:
	docker rmi ${IMAGE}
