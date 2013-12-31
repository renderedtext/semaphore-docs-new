---
layout: post
title: The build sequence
category: The Semaphore platform
---

The build sequence on Semaphore consists of the following steps.

### Checkout revision from GitHub

When the GitHub webhook hits Semaphore, your repository is initialized to the specified revision.

### Start build VM

A new virtual machine is booted. It comes preinstalled with the platform's [supported stack](/supported-stack). [Extending it](/how-to-install-dependency) is also easy.

### Copy code to VM

Your code will be placed in `~/home/runner/:project_name`.

### Emulate display

Xvfb (X Virtual Framebuffer) is launched for running tests that require GUI, such as those backed by Selenium.

### Set Ruby version

Semaphore uses [rbenv](https://github.com/sstephenson/rbenv) for managing Ruby versions. This has no effect on builds based on other programming languages.

### Export all environment variables

For a full list of available variables, please see [this page](/available-environment-variables).

### Create Semaphore cache directory

Semaphore caches directories for Ruby and Node.js projects by default, but we also provide `.semaphore-cache` directory which you can use custom caching. For more information on this topic, please read about [caching between builds](/cache-between-builds).

### Write custom files

Any [custom configuration files](/how-to-securely-add-custom-file) you've added are written to disk.

### Run your build commands

These are the commands specified in your project's build settings. The current directory is set to `/home/runner/:project_name`.

### Export thread result

After all build commands for a specific thread are completed, Semaphore exports `SEMAPHORE_THREAD_RESULT` which can be used in post-thread commands.

### Run post-thread commands

[Post-thread commands](/post-thread-commands) are executed after build commands on each thread, regardless of whether the build commands passed or failed.

### Cache repository and vendor dependencies

Project's git history and any vendor dependencies are [cached](/cache-between-builds) for later reuse.
