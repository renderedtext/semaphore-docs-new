---
layout: post
title: Setting up continuous delivery with AWS EC2 Container Registry
category: Docker
---

[Amazon EC2 Container Registry](https://aws.amazon.com/ecr/) is a Docker
container registry for easy deployment, storage and management of Docker images.
It comes from a family of [Amazon Web Services (AWS)](https://aws.amazon.com/),
so if you don't already have an Amazon account, you can
[sign up](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html).

Integrating your **Semaphore account** with **Amazon EC2 Container Registry
(ECR)** is quick and straightforward and it will take a couple of minutes of
your time.

Projects that are set up to use **Docker** will have container registry
integrations available as project add-ons. More on how to set up your project
as a Docker project in our documentation page,
[Setting up a continuous integration for a Docker project on Semaphore](/docs/docker/setting-up-continuous-integration-for-docker-project.html).

Configuring the Amazon EC2 Container Registry (ECR) project add-on will enable
you to **push** and **pull** your images without explicitly having to login to
ECR during builds and deployments.

This can be done by visiting your project on Semaphore and clicking "Add-ons"
at the upper right corner of your screen.

<img src="/docs/assets/img/docker/shared/click-add-ons.png" class="img-responsive img-bordered" alt="Click Project Add-ons">

Next, click "Docker Registry".

<img src="/docs/assets/img/docker/shared/select-docker-registry.png" class="img-responsive img-bordered" alt="Click Docker Registry">

Choose "Amazon EC2 Container Registry (ECR)" integration.

<img src="/docs/assets/img/docker/setting-up-amazon-container-registry-for-your-project/select-amazon-container-registry.png" class="img-responsive img-bordered" alt="Click Amazon Container Registry">

Then you will be prompted with three input fields requiring
your:

  - `AWS Access Key ID`,
  - `AWS Secret Access Key`,
  - `AWS Region` - region where your repository resides.

<img src="/docs/assets/img/docker/setting-up-amazon-container-registry-for-your-project/amazon-container-registry-form.png" class="img-responsive img-bordered" alt="Amazon Container Registry form">

You can find instructions for managing AWS credentials at
[their documentation](http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html).
You should also consider making an
It is a good practice to create a new [IAM user](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)
whose purpose will be to interact with Semaphore.

Click "Test & Save" and if your credentials are valid, registry will be saved.
Semaphore will encrypt your credentials and store them securely.

You can now push or pull images on Amazon Container Registry through Semaphore.

Happy building!
