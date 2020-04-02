
# Deploy to docker

Build app image and deploy to specific docker registry.

### Usage

```yaml
jobs:
  build:
    steps:
      - uses: tvrcgo/deploy-to-docker@v0.1
        width:
          registry: registry.cn-shenzhen.aliyuncs.com
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
          repository: tvrcgo/app-boilerplate

```

- A Dockerfile is required in the root directory.

### Options

- registry: docker registry host
- username: docker username
- password: docker password
- repository: docker repository without tag
