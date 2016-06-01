---
layout: post
title: Setting up Google Container Registry for your project
category: Docker
---

[Google Container Registry](https://cloud.google.com/container-registry/) is
a private Docker container registry for managing Docker images. In order use
**Google Container Registry (GCR)** [Google account](https://accounts.google.com/signup)
is needed.

Setting up **Google Container Registry (GCR)** for your project is simple
and pretty straightforward.

If your project is not set up as a **Docker project**, you should consult
[Setting up a continuous integration for a Docker project on Semaphore](/docs/docker/setting-up-continuous-integration-for-docker-project.html)
page in our documentation.

Configuring your project as **Docker** project will enable you to set up
Docker registry integrations in project add-ons.

By adding Google Container Registry integration, you will be able to **push**
and **pull** effortlessly and without worrying about authenticating to GCR.

In order to get the needed data for GCR integration you need to:

  1. Visit [Google Developers Console](https://console.developers.google.com/)

  2. Choose a project you want to integrate with Semaphore

  <img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/select-project.png" class="img-responsive img-bordered" alt="Select Project on Google Developers Console">

  3. Click "IAM & Admin" in a menu on the left

  <img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/select-iam.png" class="img-responsive img-bordered" alt="Select IAM & Admin on Google Developers Console">

  4. Go to "Service accounts" and click "Create service account"

  <img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/click-create-service-account.png" class="img-responsive img-bordered" alt="Click Create service account on Google Developers Console">

  5. Type in a meaningful name to you, we named it _Semaphore_ since we are making
  an integration with Semaphore. Then tick "Furnish a new private key" and
  leave "JSON" selected. Finally click "Create" and public/private key JSON
  file will be saved to your disk.

  <img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/create-service-account.png" class="img-responsive img-bordered" alt="Create Service account on Google Developers Console">

  Save this file somewhere safe, because you won't be able to retrieve it again from
  the Google Console.

Visit your project on Semaphore and click "Add-ons" at the upper right
corner of your screen.

<img src="/docs/assets/img/docker/shared/click-add-ons.png" class="img-responsive img-bordered" alt="Click Project Add-ons">

Next, click "Docker Registry".

<img src="/docs/assets/img/docker/shared/select-docker-registry.png" class="img-responsive img-bordered" alt="Click Docker integrations">

Choose "Google Container Registry (GCR)" integration.

<img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/select-google-container-registry.png" class="img-responsive img-bordered" alt="Click Google Container Registry">

Enter your email and **copy contents** of JSON file you downloaded earlier from Google Console.

<img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/google-container-registry-form.png" class="img-responsive img-bordered" alt="Copy Google Container Registry JSON file">

After you have copied the contents, you can click "Save". Semaphore will
safely encrypt and store your Google credentials.

You can now push or pull images on Google Container Registry through Semaphore.

Happy building!
