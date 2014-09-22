---
layout: post
title: Deploying with git-deploy
category: Deploying your application
---

You can easily use [git-deploy](https://github.com/mislav/git-deploy) or just
plain git with [custom hooks](http://git-scm.com/book/en/Customizing-Git-Git-Hooks)
to deploy your application from Semaphore. To do that, you need to:

- Generate new SSH key-pair. Add the public SSH key to your server. The private
ssh key will be added to Semaphore later.

- Create a new deploy server:

<img src="/docs/assets/img/deploying-to-heroku/settings.png" class="img-responsive">

- Choose "Generic" deployment method.

<img src="/docs/assets/img/deployment-method.png" class="img-responsive">

- Choose either Automatic or Manual deployment strategy.

- Enter deploy commands. Each deploy should:
  - Gather the public ssh host keys of your server(s) to avoid authorization prompt during deploy.
  - Add a remote to where you push your code on the server.
  - Push to the branch that is currently checked out to remote.

This translates into the following deploy commands (adapt to your values):

```bash
ssh-keyscan -H -p 22 yourserver.com >> ~/.ssh/known_hosts
git remote add production "user@yourserver.com:/apps/myapp/current" || true
git push --force production $BRANCH_NAME:master
```

- Paste the private SSH key you generated earlier.
- Finish up the process and start deploying!
