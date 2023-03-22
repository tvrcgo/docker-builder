#!/bin/bash

# docker login
echo "$INPUT_PASSWORD" | docker login -u "$INPUT_USERNAME" --password-stdin $INPUT_REGISTRY

IFS=','
read -ra tags <<< "$INPUT_TAGS"

# build
tag_args=$(for tag in "${tags[@]}"; do printf "%s " "--tag $tag"; done | sed 's/ *$//g')
docker buildx build --file $INPUT_DOCKERFILE --platform $INPUT_PLATFORMS $tag_args $INPUT_CONTEXT

# push
for tag in "${tags[@]}"; do
  docker push $INPUT_REGISTRY/$tag
done
