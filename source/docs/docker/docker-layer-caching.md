---
layout: post
title: Docker layer caching
category: Docker
---

Docker caches the layers generated while building an image. Subsequent builds
of the same image will reuse the cached layers that have not changed, thus
considerably improving the building speed.

Since [Docker 1.13](https://github.com/moby/moby/blob/master/CHANGELOG.md#1130-2017-01-18),
the `docker build` command introduced a new switch `--cache-from`, which allows
to specify a tagged image as a cache source. More than one image can be
specified with several `--cache-from` switches, each given a tagged image.
The image resulting from the build  can also be used as a cache source in
another Docker build.

As a result of changes in Docker's caching mechanism, our `docker-cache` tool
is deprecated. We suggest you use a Docker container registry instead.

## How to use Docker layer caching in Semaphore builds

The image(s) used as a caching source would be stored on a Docker container
registry. The image resulting from the build in Semaphore would be pushed in a
container registry, and later pulled and reused in subsequent Semaphore builds.

Make sure you have configured Semaphore to
[integrate with a Docker container registry](/docs/docker/setting-up-continuous-integration-for-docker-project.html)
so you can use it for storing the Docker images.

When working with Docker images, it helps to `export` the name of the image as
an environmental variable, or define it in your
[project's Environmental variables](/docs/exporting-environment-variables.html),
so you can easily change it later, if necessary.

In the code below, `DOCKER_IMAGE` specifies the name of the Docker image,
together with the registry address and port, e.g. `registry.com:5000/project`.

`BRANCH_NAME` was chosen as a tag in order to ensure a good cache hit. If you
would like to push your image to a container registry for production use,
after these commands you should use `docker tag` to tag it with the version
format you prefer, and then `docker push` to push it once again.

Place the following code as a job in your project's
[Build settings](/docs/customizing-build-commands.html):

```
docker pull $DOCKER_IMAGE:$BRANCH_NAME || true
docker build --cache-from $DOCKER_IMAGE:$BRANCH_NAME --tag $DOCKER_IMAGE:$BRANCH_NAME .
docker push $DOCKER_IMAGE:$BRANCH_NAME
```

The first command will pull the tagged image of your build from the registry,
if it's available. If it is the first build, or the image is missing from the
registry, it will skip to the next step.

The second command will build a Docker image and tag it with the branch name,
the context being your project's directory. In case the tagged image is
available, it will be used as a cache source.

The last command will push the resulting tagged Docker image to your container
registry, together with its dependent layers. Once pushed, it will be available
for reuse as a cache source for your next build.

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

In order to improve the speed of pushing and pulling images in your Semaphore
builds, the Docker container registry should be geographically as close as
possible to the Semaphore build servers.

To compare approximately how much time is needed to push or pull a Docker
image, depending on the registry's physical location and the image's size,
you may see the results of our benchmarks visualized on these charts:

<img src="/docs/assets/img/docker/docker-layer-caching/registry-push-graph.png" class="img-responsive img-bordered" alt="Time needed to push Docker image to registry">
<img src="/docs/assets/img/docker/docker-layer-caching/registry-pull-graph.png" class="img-responsive img-bordered" alt="Time needed to pull Docker image from registry">

Note that `local` refers to a local Docker container registry.
