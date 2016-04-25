---
layout: post
title: Deploy sequence
category: The Semaphore platform
---

The deploy sequence on Semaphore consists of the following steps.

### Checkout revision from GitHub

When a build is finished in case of automatic deployment, or when a manual deploy is launched, your repository is initialized to the revision specified in the corresponding build.

Your repository along with its dependencies will, in most cases, be retrieved from cache. For more information, please see [this page](/docs/caching-between-builds.html).

### Start build VM

A new virtual machine is booted. It comes preinstalled with the platform's [supported stack](/docs/supported-stack.html). [Extending it](/docs/how-to-install-dependency.html) is also easy.

### Copy code to VM

Your code will be placed in `/home/runner/:project_name`.

### Export all environment variables

For a full list of available variables, please see [this page](/docs/available-environment-variables.html).

### Write custom files

Any [custom configuration files](/docs/adding-custom-configuration-files.html) you've added are written to disk.

### SSH key initialization

This is executed in case the deploy is using an SSH keypair ([Capistrano](/docs/deploying-with-capistrano.html) or Generic method). Your key is saved to `~/.ssh/id_rsa` and initialized with `ssh-add ~/.ssh/id_rsa`.

### Run your deploy commands

These are the commands specified in your server's settings. The current directory is set to `/home/runner/:project_name`.
