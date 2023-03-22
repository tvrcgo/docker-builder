
# Docker builder

Build docker image and push to specific registry.

### Usage

```yaml
jobs:
  build:
    steps:
      - uses: tvrcgo/docker-builder@master
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_PASSWORD }}
          tags: tvrcgo/app:latest

```

- A `Dockerfile` used to build image is required in root directory.

### Options

- `username`
- `password`
- `tags`
- `registry` Default is 'docker.io'
- `context` Build context, default is '.'
- `dockerfile` Dockerfile name, default is 'Dockerfile'
- `platforms` Default is 'linux/amd64,linux/arm64'
