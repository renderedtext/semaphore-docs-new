---
layout: post
title: How to increase the amount of available memory?
category: Build troubleshooting
---

If your test suite runs out of memory even after stopping non essential
services, we’d suggest creating a swap file (which implies sacrificing a
certain amount of  disk space), by adding:

```
sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=1M count=1024
sudo mkswap /swapfile
sudo swapon /swapfile
```

These commands will create a 1GB swap file. If you’d like to create a larger
swap file, you’d need to Increase the count parameter. The Semaphore Classic
environment runs in a RAMDisk, so the performance overhead of a swap file
should be minimal.
