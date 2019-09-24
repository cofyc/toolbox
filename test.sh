#!/bin/bash

docker build -t toolbox:latest .
docker run -it --rm toolbox:latest bash
