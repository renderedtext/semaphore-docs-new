---
layout: post
title: Docker layer caching
category: Docker
---

- [How to use Docker layer caching](#usage)
- [Layer caching in Docker Compose](#docker_compose)
- [How does Docker's caching work](#how_caching_works)
- [Best practices](#best_practices)

## <a name="usage" href="#usage">How to use Docker layer caching</a>

The following snippet demonstrates how to build an image using `--cache-from`,
once you've configured a [Docker integration](/docs/docker.html), using a pre-existing image as the cache source.
The commands should be part of your [project's build settings](/docs/customizing-build-commands.html):

```bash
export CACHE_IMAGE=aws_account_id.dkr.ecr.us-east-1.amazonaws.com/my-app

docker pull $CACHE_IMAGE:$BRANCH_NAME || true
docker build --cache-from $CACHE_IMAGE:$BRANCH_NAME --tag $CACHE_IMAGE:$BRANCH_NAME .
docker push $CACHE_IMAGE:$BRANCH_NAME
```

The [Semaphore's environment variable](/docs/available-environment-variables.html)
`BRANCH_NAME` was chosen as a tag, in order to ensure a good cache hit.
This way, each branch will have its own cache, so cache collision is avoided.

The `CACHE_IMAGE` environment variable specifies the name of the Docker image, used
as a cache source, which is usually your main application image.

The first command will attempt to pull the image from the registry. If this is
the first time building this branch's image, pulling will be skipped.

The second command will build a Docker image, and tag it with the branch name.
In case the tagged image is available, it will be used as a cache source.

The last command will push the resulting tagged Docker image to your container
registry, together with its dependent layers. Once pushed, it will be available
for reuse as a cache source in consequent builds.
To automate the authentication process for your chosen registry, configure your
project to integrate with [one of the supported
methods](/docs/docker/setting-up-continuous-integration-for-docker-project.html).

After these steps, you can tag and push images as you normally would.

## <a name="docker_compose" href="#docker_compose">Layer caching in Docker Compose</a>

Since [Docker Compose 1.12.0](https://github.com/docker/compose/blob/master/CHANGELOG.md#1120-2017-04-04),
support for [`cache_from`](https://docs.docker.com/compose/compose-file/#cache_from)
was made available to be included in the `build` section of services.
This clause allows you to define one or more images that will be used as cache
sources.

```yaml
version: '3.2'

services:
  web:
    build:
      context: .
      cache_from:
        - ${CACHE_IMAGE}
    volumes:
     - .:/code
```

## <a name="how_caching_works" href="#how_caching_works">How does Docker's caching work</a>

When building an image from a `Dockerfile`, each line generates its own layer. These
layers are [cached](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#build-cache)
and they can be reused, if no changes are detected. If a layer changes, all
the following layers have to be created from scratch.

Starting with [Docker 1.13](https://github.com/moby/moby/blob/master/CHANGELOG.md#1130-2017-01-18),
the `docker build` command introduced a new switch `--cache-from`, which allows
to specify a tagged image as a cache source. More than one image can be
specified with several `--cache-from` switches, each given a tagged image.
The image resulting from the build  can also be used as a cache source in
another Docker build.

As a result of changes in Docker's caching mechanism, our `docker-cache` tool
is deprecated. We recommend using `--cache-from` combined with a Docker container
registry instead.

## <a name="best_practices" href="#best_practices">Best practices</a>

When working with Docker images, it's convenient to `export` the name of the image as
an environmental variable, or define it in your
[project's environment variables](/docs/exporting-environment-variables.html),
so you can write compact Docker commands.

To maximize layer re-use between builds, it's important to structure the
`Dockerfile` so that frequently changing steps (eg. `ADD`ing code) are towards
the end, and less frequently changing steps (eg. `RUN`ing `apt-get install`) are
on top. This will assure that steps which are concerned with doing the same
action are not unnecessarily rebuilt. See our guide for [Lightweight Docker
Images in 5 Steps](/blog/2016/12/13/lightweight-docker-images-in-5-steps.html) for more details.

In order to improve the speed of pushing and pulling images in your Semaphore
builds, the Docker container registry should be geographically as close as
possible to the Semaphore build servers in Germany.
To compare approximately how much time is needed to push or pull a Docker
image, depending on the registry's physical location and the image's size,
see the results of our benchmarks visualized on these charts:

<img src="/docs/assets/img/docker/docker-layer-caching/registry-push-graph.png" class="img-responsive img-bordered" alt="Time needed to push Docker image to registry">
<img src="/docs/assets/img/docker/docker-layer-caching/registry-pull-graph.png" class="img-responsive img-bordered" alt="Time needed to pull Docker image from registry">

Note that `local` refers to a local Docker container registry, running inside the build
environment. This functionality isn't shipped with the environment, and serves
only as a base line. The images' contents are generated using `/dev/urandom` to avoid any
compression which might occur during the push and pull operations. As such, these
transfer speeds are not likely to occur, and standard images will have considerably
better performance.
