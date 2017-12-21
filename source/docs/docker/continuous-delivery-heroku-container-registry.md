---
layout: post
title: Setting up continuous delivery with Heroku Container Registry
category: Docker
---

[Heroku](https://www.heroku.com/) is a powerful platform for deploying your
applications.  It supports deploying apps written in many languages and
frameworks out of the box. This includes support for deploying and running
Dockerized apps easily.

Deploying Docker images to **Heroku** with **Semaphore** is intuitive and
simple, and it only takes a few clicks.

In order to use **Docker Registry integrations**, you first need to set up
your project as a Docker project on Semaphore. Read
[Setting up continuous integration for a Docker project on Semaphore](/docs/docker/setting-up-continuous-integration-for-docker-project.html)
for more information.

Configuring the **Heroku Container Registry** project add-on will enable you to
**push** Docker images without having to log into Heroku during builds and
deployments.

This can be done by visiting your project on Semaphore and clicking "Add-ons"
in the upper right corner of your screen.

<img src="/docs/assets/img/docker/shared/click-add-ons.png" class="img-responsive img-bordered" alt="Click Project Add-ons">

Next, click "Docker Registry".

<img src="/docs/assets/img/docker/shared/select-docker-registry.png" class="img-responsive img-bordered" alt="Click Docker Registry">

Choose the "Heroku Container Registry" integration.

<img src="/docs/assets/img/docker/continuous-delivery-heroku-docker-registry/select-heroku-container-registry.png" class="img-responsive img-bordered" alt="Click Heroku Container Registry integration">

Next, you will be prompted with an input field requiring your Heroku API key.

You can obtain Heroku API key in
[Heroku account settings](https://dashboard.heroku.com/account).

<img src="/docs/assets/img/docker/continuous-delivery-heroku-docker-registry/heroku-container-registry-form.png" class="img-responsive img-bordered" alt="Heroku Container Registry form">

After you have entered the API key, click "Save". Your Heroku Container
Registry credentials will be securely encrypted and saved.

You can now push images to Heroku Container Registry through Semaphore.

It's best to push images using
[Heroku's official documentation](https://devcenter.heroku.com/articles/container-registry-and-runtime#pushing-an-existing-image):

```
docker tag <image> registry.heroku.com/<app>/<process-type>
docker push registry.heroku.com/<app>/<process-type>
```

Happy building!
