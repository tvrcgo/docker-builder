#!/bin/bash

IFS=','
read -ra tags <<< "$INPUT_TAGS"

# docker login
echo "$INPUT_PASSWORD" | docker login -u "$INPUT_USERNAME" --password-stdin $INPUT_REGISTRY

# build and push
tag_args=$(for tag in "${tags[@]}"; do printf "%s " "-t $tag"; done | sed 's/ *$//g')
echo "$INPUT_CONTEXT $INPUT_TAGS $INPUT_PLATFORMS $INPUT_DOCKERFILE $tag_args"

docker buildx create --use
docker buildx build --file $INPUT_DOCKERFILE --platform $INPUT_PLATFORMS $tag_args --push $INPUT_CONTEXT
