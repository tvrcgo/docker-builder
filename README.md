
# Deploy to docker

Build app image and deploy to specific docker registry.

### Usage

```yaml
jobs:
  build:
    steps:
      - uses: tvrcgo/deploy-to-docker@master
        with:
          registry: registry.cn-shenzhen.aliyuncs.com
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
          repository: tvrcgo/app-boilerplate

```

- A `Dockerfile` used to build image is required in root directory.

### Options

- `registry`
- `username`
- `password`
- `repository`
- `tag`
- `context` Build context, default is '.'
- `dockerfile` Dockerfile name, default is 'Dockerfile'
