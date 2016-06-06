---
layout: post
title: Setting up continuous delivery with Google Container Registry
category: Docker
---

[Google Container Registry](https://cloud.google.com/container-registry/) is
a private container registry for managing Docker images. In order to use
**Google Container Registry (GCR)**, you will need a [Google account](https://accounts.google.com/signup).

Setting up **Google Container Registry (GCR)** for your project is simple
and straightforward.

If your project is not set up as a **Docker project**, you should check out our
documentation page on
[setting up continuous integration for a Docker project on Semaphore](/docs/docker/setting-up-continuous-integration-for-docker-project.html) for more information.

Configuring your project as a **Docker** project will enable you to set up
Docker registry integrations in project add-ons.

By adding the Google Container Registry integration, you will be able to **push**
and **pull** images effortlessly, without having to worry about authentication.

In order to get the data needed for enabling the GCR integration, you will need
to:

  1. Visit the [Google Developers Console](https://console.developers.google.com/).

  2. Choose a project you want to integrate with Semaphore.

  <img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/select-project.png" class="img-responsive img-bordered" alt="Select Project on Google Developers Console">

  3. Click "IAM & Admin" in the left-hand menu.

  <img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/select-iam.png" class="img-responsive img-bordered" alt="Select IAM & Admin on Google Developers Console">

  4. Go to "Service accounts" and click "Create service account".

  <img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/click-create-service-account.png" class="img-responsive img-bordered" alt="Click Create service account on Google Developers Console">

  5. Type in a name that is meaningful to you. We named the account _Semaphore_, since we
  are making an integration with Semaphore. Tick "Furnish a new private
  key", and leave "JSON" selected. Finally, click "Create", and the
  public/private key JSON file will be saved to your disk.

  <img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/create-service-account.png" class="img-responsive img-bordered" alt="Create Service account on Google Developers Console">

  Store this file somewhere safe — you won't be able to retrieve it again from
  the Google Console.

Visit your project on Semaphore, and click "Add-ons" in the upper right
corner of your screen.

<img src="/docs/assets/img/docker/shared/click-add-ons.png" class="img-responsive img-bordered" alt="Click Project Add-ons">

Next, click "Docker Registry".

<img src="/docs/assets/img/docker/shared/select-docker-registry.png" class="img-responsive img-bordered" alt="Click Docker integrations">

Select the "Google Container Registry (GCR)" integration.

<img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/select-google-container-registry.png" class="img-responsive img-bordered" alt="Click Google Container Registry">

Enter your email and copy the contents of the JSON file you downloaded earlier
from the Google Console.

<img src="/docs/assets/img/docker/setting-up-google-container-registry-for-your-project/google-container-registry-form.png" class="img-responsive img-bordered" alt="Copy Google Container Registry JSON file">

Once you've copied the contents, click "Save". Semaphore will safely encrypt
and store your Google credentials.

You can now push or pull images from Google Container Registry through Semaphore.

Happy building!
