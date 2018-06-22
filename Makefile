all:
	@echo "build:  ..."
	@echo "run:    ..."
        @echo "shell:  ..."

build:
	docker build -t packettracer .

run:
	docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix packettracer

shell:
	docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix packettracer /bin/bash
