---
layout: post
title: Deployment fails with "permission denied (publickey)"
category: Deployment
---

When this happens the first thing to check is if you have correctly configured the SSH key. The public key should be pasted in Semaphore. The public key should be present on the server, in the `.ssh/authorized_keys` file, inside the deploy user’s home directory. This key combination gives Semaphore permission to SSH inside the server.

The second thing to check is "SSH agent forwarding". If it's on, server tries to clone repo with forwarded key (from Semaphore) and fails, because this key is unknown to GitHub. The solution is to disable SSH agent forwarding and make sure that server has another [deploy key](https://help.github.com/articles/managing-deploy-keys#deploy-keys) for cloning repo.

Another approach is to keep SSH agent forwarding, but configure the key pair which is used with Semaphore to be a deploy key on GitHub as well.
