---
layout: post
title: Customizing build commands
category: Customizing your build
---

You can easily customize commands that Semaphore executes in order to build your project.

Typical use cases for custom build commands that we have seen so far are:

 * setting up custom database configuration files
 * calling a custom rake task for setting up seed db data
 * passing special flags to default rake tasks
 * exporting environment variables that contain sensitive information which you don’t want to keep in your repository

Each build or deploy command is executed as a Linux shell command.

To change commands follow the simple steps bellow.

### 1. Click on "settings" next to your project on the dashboard.

<img src="/docs/assets/img/custom-build-commands/cbc-project-settings-link.png" class="img-responsive">

### 2. Review your commands

If your plan allows, you can schedule your commands to run in multiple threads. Click "Change build commands" to edit them.

<img src="/docs/assets/img/custom-build-commands/cbc-commands.png" class="img-responsive">

### 3. Edit and save your new commands

<img src="/docs/assets/img/custom-build-commands/cbc-edit.png" class="img-responsive">

Note that Semaphore exports some [environment variables](/docs/available-environment-variables.html) which might be useful to you. You can also install additional packages with commands like `sudo apt-get install -y something`.
