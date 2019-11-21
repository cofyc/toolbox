
all: build
.PHONY: all

build:
	docker build -t cofyc/toolbox:latest .

run: build
	docker run -it --rm cofyc/toolbox:latest
