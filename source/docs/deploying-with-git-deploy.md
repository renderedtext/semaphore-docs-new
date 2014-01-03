---
layout: post
title: Deploying with git-deploy
category: Deploying your application
---

You can use [git-deploy](https://github.com/mislav/git-deploy) to deploy your app on Semaphore. To do that, you need to:

- Add server's public key to `known_hosts` as to not get prompted to authorize the authenticity of the server.
- Add a remote to where you push your code on the server.
- Push to the branch that is currently checked out to remote.

This translates into the following deploy commands (adapt to your values):

```bash
echo {SERVER_PUBLIC_KEY} >> ~/.ssh/known_hosts
git remote add production "user@yourserver.com:/apps/myapp/current"
git push production master
```

Note: select "Using a deploy script" option when adding a new deploy server for your project.
