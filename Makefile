
all: build
.PHONY: all

build:
	docker build -t cofyc/toolbox:latest .

push:
	./hack/push.sh cofyc/toolbox:latest

run:
	docker run -it --rm cofyc/toolbox:latest
