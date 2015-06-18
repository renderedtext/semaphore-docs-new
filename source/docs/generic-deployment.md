---
layout: post
title: Generic Deployment
category: Deploying your application
---

Semaphore has built-in support for Heroku, Capistrano and Cloud66. However, if
this does not meet your needs, Semaphore also supports generic deployment with
which you can select your own tools and servers.

To get started, go to your project's page and click on the "Set Up Deployment"
button.

<img src="/docs/assets/img/generic-deployment/project-page.png" alt="project-page" class="img-responsive img-bordered">

This will launch a simple five-step process.

## Deployment method

The first step is to select Generic Deployment.

<img src="/docs/assets/img/generic-deployment/deployment-method.png" alt="deployment-method" class="img-responsive img-bordered">

## Deployment strategy

The next step is choosing your deployment strategy.
Semaphore supports two deployment strategies, Automatic and Manual.
You can read more about them [here](/docs/understanding-automatic-and-manual-deployment.html).

<img src="/docs/assets/img/generic-deployment/deployment-strategy.png" alt="deployment-strategy" class="img-responsive img-bordered">

If you chose automatic deployment, you need to chose a branch whose successful 
build should trigger a deploy. 
If you chose manual deployment, this step is skipped.

<img src="/docs/assets/img/generic-deployment/deployment-branch.png" alt="deployment-branch" class="img-responsive img-bordered">

## Deploy commands

Enter custom commands you need Semaphore to execute. Here you can use your 
custom deployment tools and scripts.

<img src="/docs/assets/img/generic-deployment/deploy-commands.png" alt="deploy-commands" class="img-responsive img-bordered">

## SSH key

This step is optional. If your server requires an SSH key for deployment,
you need to copy the contents of your private key here.

<img src="/docs/assets/img/generic-deployment/ssh-key.png" alt="ssh-key" class="img-responsive img-bordered">

We recommend generating one specifically for Semaphore. 
Semaphore will safely encrypt it. Make sure that the corresponding public key 
is present in the server's authorized_keys list. 

Through these steps you give Semaphore permission to access your server and 
successfully execute deploy commands.

**Note:** The private key will be encrypted on Semaphore and will be available
only during the deployment process. After the initial setup, it is not possible to
change it through the Semaphore interface. You can identify it with the fingerprint
on the project settings page.

## Server name

Next, you can choose a name for the Server, Semaphore will automatically generate a name
for you, but it is recommended to change it to something meaningful for your
application and/or server.

<img src="/docs/assets/img/generic-deployment/server-name.png" alt="server-name" class="img-responsive img-bordered">

This completes the generic deployment setup. You are now ready to deploy your
application to your server.

<img src="/docs/assets/img/generic-deployment/successful-setup.png" alt="successful-setup" class="img-responsive img-bordered">
