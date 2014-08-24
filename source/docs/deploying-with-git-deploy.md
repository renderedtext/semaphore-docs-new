---
layout: post
title: Deploying with git-deploy
category: Deploying your application
---

You can easily use [git-deploy](https://github.com/mislav/git-deploy) or just
plain git with [custom hooks](http://git-scm.com/book/en/Customizing-Git-Git-Hooks)
to deploy your application from Semaphore. To do that, you need to:

- Gather the public ssh host keys of your server(s) to avoid authorization prompt during deploy.
- Add a remote to where you push your code on the server.
- Push to the branch that is currently checked out to remote.

This translates into the following deploy commands (adapt to your values):

```bash
ssh-keyscan -H -p 22 yourserver.com >> ~/.ssh/known_hosts
git remote add production "user@yourserver.com:/apps/myapp/current" || true
git push production master
```

__Note:__

Select "Generic" as your deployment method in the process of creating a new deploy server,
and add a private SSH key with permissions to push to the newly added remote.
