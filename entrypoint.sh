#!/bin/sh -l

TAG=dtd-$(date +"%Y%m%d%H%M%S")

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin $DOCKER_REGISTRY
docker build . --tag $DOCKER_REGISTRY/$DOCKER_REPO:$TAG
docker push $DOCKER_REGISTRY/$DOCKER_REPO:$TAG
