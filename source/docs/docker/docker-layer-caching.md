---
layout: post
title: Docker Layer Caching
category: Docker
---

Docker caches the layers generated while building an image. Subsequent builds
of the same image will reuse the cached layers that have not changed, thus
considerably improving the building speed.

Since [Docker 1.13](https://github.com/moby/moby/blob/master/CHANGELOG.md#1130-2017-01-18),
the `docker build` command introduced a new switch `--cache-from`, which allows
to specify a tagged image as a cache source. This image's layers would then be
reused when a Docker image is being built, considerably speeding up the build.
More than one image can be specified as a cache source, and the resulting image
can also be used as a cache source in another Docker build.

The image(s) used as a caching source can be stored on a Docker container
registry (ECR, GCR, and similar). The image resulting from the build in
Semaphore can then be pushed in a container regustry, and later pulled and
reused in subsequent Semaphore builds.

Since Docker stores only the changes between layers and reuses unchanged layers
between builds, it will use disk space sparingly on the container registry.

As a result of changes in Docker's caching mechanism, our `docker-cache` tool
is deprecated. We suggest you use a Docker registry for caching built images.

## How to use Docker caching in Semaphore builds

Before you begin, make sure you have configured Semaphore to
[integrate with a Docker container registry](/docs/docker/setting-up-continuous-integration-for-docker-project.html).
This registry will contain tagged images of your project that were previously
built and pushed successfully through Semaphore, and their dependencies too.
The last successfully built image will also be tagged with the `latest` tag,
and it will be pulled and used as a cache source in your Semaphore build jobs.

To make it easy to perform changes in your project's builds, define several
[environmental variables in your project's Build settings](/docs/available-environment-variables.html):

- `DOCKER_IMAGE_NAME` with the name of the Docker image you want to build (e.g.
  `my-project_${BRANCH_NAME}`)
- `REGISTRY_URL` with the URL to the registry (e.g. `myregistry.com`)
- `REGISTRY_PORT` with the port used to access the registry (e.g. `5000`)

Place the following code as a job in your project's
[Build settings](/docs/customizing-build-commands.html):

```
docker pull $REGISTRY_URL:$REGISTRY_PORT/$DOCKER_IMAGE_NAME || true
docker build --cache-from $REGISTRY_URL:$REGISTRY_PORT/$DOCKER_IMAGE_NAME --tag $REGISTRY_URL:$REGISTRY_PORT/$DOCKER_IMAGE:${REVISION}_${SEMAPHORE_BUILD_NUMBER} .
docker tag $REGISTRY_URL:$REGISTRY_PORT/$DOCKER_IMAGE:${REVISION}_${SEMAPHORE_BUILD_NUMBER} $REGISTRY_URL:$REGISTRY_PORT/$DOCKER_IMAGE:latest
docker push $REGISTRY_URL:$REGISTRY_PORT/$DOCKER_IMAGE:latest
```

The first command will pull the `latest`-tagged image of your build from the
registry, if it's available. If it is the first build, or the image is missing
from the registry, it will skip to the next step.

The second command will build a Docker image, the context being your project's
directory, and tag it with the revision and Semaphore build number. In case the
`latest` image is available, it will be used as a cache source.

The last two commands will tag the resulting Docker image with the `latest` tag
and push it to your container registry, along with its dependent layers. Once
pushed, it will be available for reuse as a cache source for your next builds.

## Layer caching in Docker Compose

Since [Docker Compose 1.12.0](https://github.com/docker/compose/blob/master/CHANGELOG.md#1120-2017-04-04),
support for [a new clause `cache_from`](https://docs.docker.com/compose/compose-file/#cache_from)
was made available to be included in the `build` section of services.
This clause allows you to define one or more images that will be used as cache
sources when the Docker images of each service need to be (re)built.

In each service section of your `docker-compose.yml` file, in their `build`
section add `cache_from` and then define the layers to be used, e.g.:

```
services:
  web:
    build:
      context: .
      cache_from:
        - ruby:2.3.4
    ports:
     - "5000:5000"
    volumes:
     - .:/code
```

## Best practices

To improve the speed of pushing and pulling images in your Semaphore builds,
the Docker container registry should be geographically as close as possible to
our Semaphore build servers.
