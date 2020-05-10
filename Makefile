#!/usr/bin/env make

.SHELL        := /bin/bash
.DEFAULT_RULE := help

PROJECT_NAME     := $(shell basename $(PWD))
DOCKER_USER      ?= jjuarez
DOCKER_IMAGE_TAG ?= latest


help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)


.PHONY: clean
clean:
	@gradle clean --no-daemon


.PHONY: build
build:  ## build the java project
	@gradle build --no-daemon --refresh-dependencies


.PHONY: docker
docker: Dockerfile  ## build the Docker image
	@DOCKER_BUILDKIT=1 docker build -t ${DOCKER_USER}/${PROJECT_NAME}:${DOCKER_IMAGE_TAG} . -f $<

