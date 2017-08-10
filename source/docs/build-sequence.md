---
layout: post
title: Build sequence
category: The Semaphore platform
---

The build sequence on Semaphore consists of the following steps.

### Checkout revision from GitHub

When the GitHub webhook hits Semaphore, your repository is initialized to the
specified revision.

Your repository along with its dependencies will, in most cases, be retrieved
from cache. For more information, please see [this
page](/docs/caching-between-builds.html).

### Start build VM

A new virtual machine is booted. It comes preinstalled with the platform's
[supported stack](/docs/supported-stack.html). [Extending
it](/docs/how-to-install-dependency.html) is also easy.

### Copy code to VM

Your code will be placed in `/home/runner/:project_name`.

### Emulate display

Xvfb (X Virtual Framebuffer) is launched for running tests that require GUI,
such as those backed by Selenium.

### Export all environment variables

For a full list of available variables, please see [this
page](/docs/available-environment-variables.html).

### Create Semaphore cache directory

Semaphore caches directories for Ruby and Node.js projects by default, but we
also provide `.semaphore-cache` directory which you can use custom caching. For
more information on this topic, please read about [caching between
builds](/docs/caching-between-builds.html).

### Write custom files

Any [custom configuration files](/docs/adding-custom-configuration-files.html)
  you've added are written to disk.

### Run your build commands

These are the commands specified in your project's build settings. The current
directory is set to `/home/runner/:project_name`.

For language related questions please consult one of our dedicated
guides found in the sidebar, under Language Support.

### Export job result

After all build commands for a specific job are completed, Semaphore exports
`SEMAPHORE_THREAD_RESULT` which can be used in after job commands.

### Run after job commands

[After job commands](/docs/using-post-thread-commands.html) are executed after
build commands on each job, regardless of whether the build commands passed or
failed.

### Cache repository and vendor dependencies

Project's git history and any vendor dependencies are
[cached](/docs/caching-between-builds.html) for later reuse.
