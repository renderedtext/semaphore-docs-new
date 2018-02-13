---
layout: post
title: Changing a system configuration file
category: Customizing your build
---

Semaphore allows you to change all system configuration settings as a super
user. This means that you can use standard bash commands for updating the
content of all files from your build commands.

For example, the following command allows you to update your `/etc/hosts` file:

```bash
sudo sh -c "echo 'yourchange' >> /etc/hosts"
```

As an alternative, you can [create a configuration file](/docs/adding-configuration-files.html)
from the Semaphore interface and then copy or move it to the desired location:

```bash
sudo mv /home/runner/my_custom_hosts /etc/hosts
```
