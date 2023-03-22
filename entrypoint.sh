#!/bin/bash

IFS=','
read -ra tags <<< "$INPUT_TAGS"

# docker login
echo "$INPUT_PASSWORD" | docker login -u "$INPUT_USERNAME" --password-stdin $INPUT_REGISTRY

# build and push
tag_args=$(for tag in "${tags[@]}"; do printf "%s " "-t '${tag}'"; done | sed 's/ *$//g')

cd $INPUT_CONTEXT
docker buildx create --use
docker buildx build \
  --file "$INPUT_DOCKERFILE" \
  --platform "$INPUT_PLATFORMS" \
  "$tag_args" \
  --push \
  .
