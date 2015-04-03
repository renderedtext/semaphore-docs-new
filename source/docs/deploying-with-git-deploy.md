---
layout: post
title: Deploying with git-deploy
category: Deploying your application
---

You can easily use [git-deploy](https://github.com/mislav/git-deploy) or just
plain git with [custom
hooks](http://git-scm.com/book/en/Customizing-Git-Git-Hooks) to deploy your
application from Semaphore. This document explains how to configure that
process.

### Step 1: Generate a new SSH key

First, generate a new, passwordless SSH key pair. Add the public SSH key to your
server, by copying its content to your server's user `~/.authorized_keys` file.

The content of a public SSH key is typically located in `~/.ssh/id_rsa.pub` or
`~/.ssh/id_dsa.pub` on your development machine.

The private SSH key will be added to Semaphore later.

### Step 2: Create a new deploy server on Semaphore

Open your project settings, Deployment tab. Click to set up a new server.

<img src="/docs/assets/img/deploying-to-heroku/settings.png" class="img-responsive">

When asked about the deployment method, choose the "Generic" option.

<img src="/docs/assets/img/deployment-method.png" class="img-responsive">

After that, select either Automatic or Manual deployment strategy. See
[understanding automatic and manual deployment on
Semaphore](/docs/understanding-automatic-and-manual-deployment.html) if you are
not sure which option would work best for you.

### Step 3: Write your deploy commands

We recommend that you read about the [sequence of steps Semaphore executes
before your deploy commands](/docs/deploy-sequence.html).

In order for our git-deploy deployment to work, we need to do the following.

- Gather the public SSH host keys of your server(s) to avoid an authorization
  prompt during deploy.
- Add a git remote to where you are about to push your code on the server.
- Push to the branch that is currently checked out in to remote.

This translates into the following deploy commands (adapt to your values):

```bash
ssh-keyscan -H -p 22 yourserver.com >> ~/.ssh/known_hosts
git remote add production "user@yourserver.com:/apps/myapp/current" || true
git push --force production $BRANCH_NAME:master
```

<img src="/docs/assets/img/deploying-with-git-deploy/git-deploy-commands.png" class="img-responsive">

### Step 4: Paste your private SSH key on Semaphore

On the next screen, simply paste the private SSH key that you generated earlier
in Step 1.

<img src="/docs/assets/img/deploying-with-git-deploy/ssh-private-key.png" class="img-responsive">

### Step 5: Name your server

This can be anything you want which described your deploy target the best.
Typical examples are "production" and "domain.io".

<img src="/docs/assets/img/deploying-with-git-deploy/server-name.png" class="img-responsive">

The final screen will show you an overview of what you've configured.

<img src="/docs/assets/img/deploying-with-git-deploy/server-overview.png" class="img-responsive">

You are now ready to finish up the process and start deploying.
