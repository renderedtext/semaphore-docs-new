---
layout: post
title: Setting up continuous delivery with Docker Hub
category: Docker
---

[Docker Hub](https://hub.docker.com/) is a cloud hosted service for managing
Docker images. You can sign up for an account [here](https://hub.docker.com/),
if you don't already have one.

Configuring your **Semaphore account** with **Docker Hub** is smooth and fast,
and it will only take a minute of your time.

If your project is set up to use **Docker**, all Docker container registry
integrations will be available in your project settings. For more information on
how to set up a Docker project on Semaphore, you can read
[Setting up continuous integration for a Docker project on Semaphore](/docs/docker/setting-up-continuous-integration-for-docker-project.html).

Configuring the Docker Hub project integration will enable you to **push** and
**pull** your images without having to log into Docker Hub during
builds and deployments, making your CI and CD process faster. This can be done
by visiting your project on Semaphore and clicking "Project settings" in the upper right
corner of your screen.

<img src="/docs/assets/img/docker/shared/click-add-ons.png" class="img-responsive img-bordered" alt="Click Project Add-ons">

Next, click "Docker Registry".

<img src="/docs/assets/img/docker/shared/select-docker-registry.png" class="img-responsive img-bordered" alt="Click Docker Registry">

Select the "Docker Hub" integration.

<img src="/docs/assets/img/docker/setting-up-docker-hub-for-your-project/select-docker-hub.png" class="img-responsive img-bordered" alt="Click Docker Hub integration">

You will be prompted with two input fields, requiring your Docker Hub
`Username` and `Password`. These credentials will be encrypted
and stored safely by Semaphore.

<img src="/docs/assets/img/docker/setting-up-docker-hub-for-your-project/docker-hub-form.png" class="img-responsive img-bordered" alt="Docker Hub form">

After you've entered your credentials, click "Save".

You can now push or pull images from Docker Hub through Semaphore.

```
docker push dockerhub_username/repository_name
```

Happy building!
