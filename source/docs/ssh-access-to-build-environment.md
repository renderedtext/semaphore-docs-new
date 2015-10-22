---
layout: post
title: SSH access to build environment
category: The Semaphore platform
---

Semaphore allows you to interactively access your project’s build environment
through an SSH session. Launching an SSH session allows you to troubleshoot
build failures, explore the platform and helps you configure projects with
specific needs quickly.

After your build or deploy is finished, Semaphore lets you start an identical
build environment where you can run your build commands. All in the comfort
of your terminal.

### Requirements

To launch an SSH session on Semaphore you'll need to add a
[public SSH key](https://semaphoreci.com/docs/managing-public-ssh-keys-for-ssh-sessions.html)
to your account settings.

### Launching a new SSH session

To launch such a build environment, visit the build or deploy page and click
on the Launch SSH button above your thread's output.

<img src="/docs/assets/img/ssh-session/ssh-session-1.png" class="img-responsive">

When the popover appears click on the Launch Session button, this will enqueue
and prepare your session.

<img src="/docs/assets/img/ssh-session/ssh-session-2.png" class="img-responsive">

Semaphore will start a build environment identical to the one where your current
build or deploy ran. Your project’s Git repository will be checked out at the same
revision. Semaphore will also export any
[configuration files](https://semaphoreci.com/docs/adding-custom-configuration-files.html) and
[environment variables](https://semaphoreci.com/docs/exporting-environment-variables.html)
which you have configured in your project's settings.

When the session is ready you will receive a command with which you can ssh
into your build server.

<img src="/docs/assets/img/ssh-session/ssh-session-3.png" class="img-responsive">

### Closing an SSH session

An SSH session will be open for 60 minutes after which it will close
automatically. To close the SSH session manually you can either close it from
the build or deploy page where it was activated or to trigger a shutdown from
the console.

<img src="/docs/assets/img/ssh-session/ssh-session-4.png" class="img-responsive">

To close the session from the console, execute the following command in the SSH
session:

``` sh
sudo poweroff
```

### Tip: rsync files into an SSH session

Take note of your assigned IP address and port, and run `rsync` with the
following command options:

```
rsync -avz -e "ssh -p <port>" testfile runner@<ip-address>:somefile
```
