
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
- `registry` Docker registry (default: 'docker.io')
- `context` Build context (default: '.')
- `dockerfile` Dockerfile name (default: 'Dockerfile')
- `platforms` Target platforms (default: 'linux/amd64,linux/arm64')
