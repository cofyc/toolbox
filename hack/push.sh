#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

ROOT=$(unset CDPATH && cd $(dirname "${BASH_SOURCE[0]}")/.. && pwd)
cd $ROOT

DOCKER_IMAGE=${DOCKER_IMAGE:-docker.io/cofyc/toolbox:latest}

if [ -n "${DOCKER_USERNAME:-}" -a -n "${DOCKER_PASSWORD:-}" ]; then
    echo "info: DOCKER_USERNAME & DOCKER_PASSWORD are both set"
    server=$(cut -d '/' -f 1 <<<"$DOCKER_IMAGE")
    echo "info: registry server is $server"
    docker login --username $DOCKER_USERNAME --password-stdin ${server} <<<"$DOCKER_PASSWORD"
fi

if [ $# -le 0 ]; then
    echo "error: no images to push"
    exit 1
fi

for image in $@; do
    echo "info: pushing $image"
    docker tag $image $DOCKER_IMAGE
    docker push $DOCKER_IMAGE
done
