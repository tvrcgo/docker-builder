#!/bin/sh -l

TAG=${GITHUB_REF##*/}-${GITHUB_RUN_ID}-$(date +"%s")

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin $DOCKER_REGISTRY
docker build . --tag $DOCKER_REGISTRY/$DOCKER_REPO:$TAG
docker push $DOCKER_REGISTRY/$DOCKER_REPO:$TAG
