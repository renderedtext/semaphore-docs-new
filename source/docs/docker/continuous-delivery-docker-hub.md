---
layout: post
title: Setting up continuous delivery with Docker Hub
category: Docker
---

[Docker Hub](https://hub.docker.com/) is a cloud hosted service for your Docker
images. You can [sign up](https://hub.docker.com/) for an account if you don't
have one already.

Configuring your **Semaphore account** with **Docker Hub** smooth and fast and
it will last a minute of your time.

Project that is set up as a **Docker** project will have Docker container
registry integrations in project add-ons. To set up your project as a Docker
project, please look into
[Setting up a continuous integration for a Docker project on Semaphore](/docs/docker/setting-up-continuous-integration-for-docker-project.html)
page in our documentation.

Configuring the Docker Hub project add-on will enable you to **push** and
**pull** your images without explicitly having to login to Docker Hub during
builds and deployments, thus making your CI and CD process painless.

This can be done by visiting your project on Semaphore and clicking "Add-ons"
at the upper right corner of your screen.

<img src="/docs/assets/img/docker/shared/click-add-ons.png" class="img-responsive img-bordered" alt="Click Project Add-ons">

Next, click "Docker Registry".

<img src="/docs/assets/img/docker/shared/select-docker-registry.png" class="img-responsive img-bordered" alt="Click Docker Registry">

Choose "Docker Hub" integration.

<img src="/docs/assets/img/docker/setting-up-docker-hub-for-your-project/select-docker-hub.png" class="img-responsive img-bordered" alt="Click Docker Hub integration">

Then you will be prompted with three input fields requiring your `Username`,
`Email` and `Password` for Docker Hub. Everything you input here will be encrypted
and saved safely by Semaphore.

<img src="/docs/assets/img/docker/setting-up-docker-hub-for-your-project/docker-hub-form.png" class="img-responsive img-bordered" alt="Docker Hub form">

After you've inputted your credentials, click "Save".

You can now push or pull images on Docker Hub through Semaphore.

Happy building!
