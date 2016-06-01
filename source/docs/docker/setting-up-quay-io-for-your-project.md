---
layout: post
title: Setting up Quay.io for your project
category: Docker
---

[Quay.io](https://quay.io/) is a cloud hosted service for your Docker images.
If you don't have an account at Quay.io, you can
[try it for free](https://quay.io/plans/?trial-plan=free).

Integrating **Quay.io** with **Semaphore** is intuitive and simple, and it
will take only a few clicks.

In order to have **Docker Registry integrations**, you should set up your
project as a Docker project. More on setting up your project is in
[Setting up a continuous integration for a Docker project on Semaphore](/docs/docker/setting-up-continuous-integration-for-docker-project.html)
documentation page.

Configuring the **Quay.io** project add-on will enable you to **push** and
**pull** Docker images without you having to login to Quay.io during builds
and deployments.

This can be done by visiting your project on Semaphore and clicking "Add-ons"
at the upper right corner of your screen.

<img src="/docs/assets/img/docker/shared/click-add-ons.png" class="img-responsive img-bordered" alt="Click Project Add-ons">

Next, click "Docker Registry".

<img src="/docs/assets/img/docker/shared/select-docker-registry.png" class="img-responsive img-bordered" alt="Click Docker Registry">

Choose "Quay.io" integration.

<img src="/docs/assets/img/docker/setting-up-quay-io-for-your-project/select-quay-io.png" class="img-responsive img-bordered" alt="Click Quay.io integration">

Then you will be prompted with three input fields:

  - Quay.io `Username`,
  - Quay.io `Password`,
  - Quay.io `Email address`.

<img src="/docs/assets/img/docker/setting-up-quay-io-for-your-project/quay-io-form.png" class="img-responsive img-bordered" alt="Quay.io form">

After you have inputted these, click "Save". Your Quay.io credentials will be
securely encrypted and saved.

You can now push or pull images on Quay.io through Semaphore.

Happy building!
