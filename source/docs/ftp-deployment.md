---
layout: post
title: FTP Deployment
category: Deploying your application
---

Semaphore has [LFTP](http://lftp.yar.ru/), an FTP/HTTP client and a file transfer
program, installed by default. LFTP can be used with the Generic Deployment
method on Semaphore.

## Configuring FTP deployment

The first step is to create 2 environment variables that will allow LFTP to
access your server. Visit the project settings environment variables tab and
create 2 new environment variables, `FTP_USER` and `FTP_PASSWORD`. Feel free to
encrypt the `FTP_PASSWORD` variable.

<img src="/docs/assets/img/ftp-deployment/environment-variables.png" alt="Environment Variables" class="img-responsive img-bordered">

Next, go to the dashboard and press "Set Up Deployment" button for that project.

<img src="/docs/assets/img/ftp-deployment/setup-deployment.png" alt="Setup Deployment" class="img-responsive img-bordered">

Choose the Generic Deployment method.

<img src="/docs/assets/img/ftp-deployment/generic-deployment.png" alt="Generic Deployment" class="img-responsive img-bordered">

The next step is choosing your deployment strategy. Semaphore supports two
deployment strategies, Automatic and Manual. You can read more about them
[here](/docs/understanding-automatic-and-manual-deployment.html).

<img src="/docs/assets/img/ftp-deployment/select-strategy.png" alt="Select Strategy" class="img-responsive img-bordered">

If you choose the automatic deployment strategy, you need to select the branch
that will be automatically deployed.

<img src="/docs/assets/img/ftp-deployment/select-branch.png" alt="Select Branch" class="img-responsive img-bordered">

After that, you need to set the commands that will perform the deploy. With
LFTP, you can deploy your application using a single line:

```bash
lftp -c "open -u $FTP_USER,$FTP_PASSWORD YOUR_FTP_HOST; set ssl:verify-certificate no; mirror -R ./ YOUR_REMOTE_PATH"
```

Copy the line and paste it in the deploy commands text area.

Here, `$FTP_USER` and `$FTP_PASSWORD` are environment variables that we
previously defined.

Replace `YOUR_FTP_HOST` and `YOUR_REMOTE_PATH` with corresponding values.

<img src="/docs/assets/img/ftp-deployment/deploy-commands.png" alt="Deploy Commands" class="img-responsive img-bordered">

Next, set a meaningful name for the new deployment target.

<img src="/docs/assets/img/ftp-deployment/server-name.png" alt="Server Name" class="img-responsive img-bordered">

After that, FTP deployment is fully configured. You can trigger the first deploy
manually right from the new server page.

<img src="/docs/assets/img/ftp-deployment/first-deploy.png" alt="First FTP Deploy" class="img-responsive img-bordered">

