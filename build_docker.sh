#!/bin/bash

BUILD_DATE="$(date +%YY%d%m%H%M)"
VCS_REF="$(git show-ref --heads --hash)"
VERSION="0.1.0"
DOCKER_USER="jjuarez"
IMAGE_TAG="latest"

docker build -t ${DOCKER_USER}/java-docker-cgroups:${IMAGE_TAG} --build-arg BUILD_DATE=${BUILD_DATE} --build-arg VCS_REF=${VCS_REF} --build-arg VERSION=${VERSION} .
