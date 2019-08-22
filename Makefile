
all: build
.PHONY: all

build:
	docker build -t toolbox:latest .

run: build
	docker run -it --rm toolbox:latest
