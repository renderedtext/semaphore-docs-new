---
layout: post
title: Setting up continuous delivery with a custom or on premise container registry
category: Docker
---

[Docker](https://www.docker.com/) brought many good things to the world of
distributed applications and containerization, and one of those things is an
ability to have **your own private container registries** for Docker images.

Setting up your **Custom Registry** with **Semaphore** is pretty
straightforward and quick.

If you are just adding a project be sure to consult
[Setting up a continuous integration for a Docker project on Semaphore](/docs/docker/setting-up-continuous-integration-for-docker-project.html)
page in our documentation in order to have Docker integrations available for
your project.

Projects that are setup as **Docker** projects will have container registry
integrations available as project add-ons.

Configuring the Custom Registry project add-on will enable you to **push** and
**pull** your images without explicitly having to login to your Custom Registry
during builds and deployments.

This can be done by visiting your project on Semaphore and clicking "Add-ons"
at the upper right corner of your screen.

<img src="/docs/assets/img/docker/shared/click-add-ons.png" class="img-responsive img-bordered" alt="Click Project Add-ons">

Next, click "Docker Registry".

<img src="/docs/assets/img/docker/shared/select-docker-registry.png" class="img-responsive img-bordered" alt="Click Docker Registry">

Choose "Custom Container Registry" integration.

<img src="/docs/assets/img/docker/setting-up-custom-container-registry-for-your-project/select-custom-container-registry.png" class="img-responsive img-bordered" alt="Click Custom Container Registry integration">

Then you will be prompted with three input fields:

  - `Username` - username you were given or set,
  - `Email` - email you were given or set,
  - `Password` - password you were given or set,
  - `Server` - your custom registry server.

<img src="/docs/assets/img/docker/setting-up-custom-container-registry-for-your-project/custom-container-registry-form.png" class="img-responsive img-bordered" alt="Custom Container Registry form">

After you have put your credentials, you can click "Save". All of your
credentials will be encrypted and saved by Semaphore.

You can now push or pull images to your custom registry through Semaphore.

Happy building!
