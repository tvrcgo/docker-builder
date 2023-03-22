#!/bin/bash

IFS=','
read -ra tags <<< "$INPUT_TAGS"

# docker login
echo "$INPUT_PASSWORD" | docker login -u "$INPUT_USERNAME" --password-stdin $INPUT_REGISTRY

for tag in "${tags[@]}"; do
  echo "<$tag>"
  printf "%s" "-t $(echo $tag | xargs)"
done

# build and push
tag_args=$(for tag in "${tags[@]}"; do printf "%s\t" "--tag $(echo $tag | xargs)"; done | xargs)

cd $INPUT_CONTEXT
docker buildx create --use
docker buildx build \
  --file "$INPUT_DOCKERFILE" \
  --platform "$INPUT_PLATFORMS" \
  $tag_args \
  --push \
  .
