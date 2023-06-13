
# Docker builder

Build and push docker image.

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

### Inputs

- `username` Registry username
- `password` Registry password
- `tags` Repo tags
- `registry` Docker registry (default: 'docker.io')
- `context` Build context (default: '.')
- `dockerfile` Dockerfile path (default: 'Dockerfile')
- `platforms` Target platforms (default: 'linux/amd64,linux/arm64')
