---
layout: post
title: Deploying with Capistrano
category: Deploying your application
---

[Capistrano](http://www.capistranorb.com) is a widely used server automation and deployment tool written in Ruby. Semaphore lets you easily use your existing Capistrano scripts to set up automatic deployment.

To get started, go to your project's settings and under "Deployment" tab follow the link to add a new server.

<img src="/docs/assets/img/deploying-with-capistrano/settings.png" width="600">

This will launch a simple 5 step process.

## Choosing your deployment method

The first step is to select Capistrano as your deployment method.

<img src="/docs/assets/img/deploying-with-capistrano/deployment-method.png" width="600">


## Choosing your deployment strategy

<img src="/docs/assets/img/deploying-with-capistrano/deployment-strategy.png" width="600">

There are two deployment strategies on Semaphore: "automatic" and "manual".

**Automatic** means that a deploy will be triggered after every passed build on the selected branch. Besides that, you can also manually deploy any build from any branch at any time.

**Manual** strategy requires manual selection of builds to deploy.

For automatic deployment you will be asked to select which branch will be automatically deployed after each passed build.

**Note**: You can easily change the deployment strategy from server settings at any time after the setup is complete.

## Writing deploy commands

<img src="/docs/assets/img/deploying-with-capistrano/deploy-commands.png" width="600">

Writing custom deploy commands gives you an ability to use the deploy steps that match your server setup. During a deploy, Semaphore sets `REVISION` environment variable which contains the current Git revision being deployed.

## Adding a private SSH key for deploy

At this point you need to provide a private SSH key which Semaphore will use to deploy your code.

<img src="/docs/assets/img/deploying-with-capistrano/add-ssh-key.png" width="600">

We recommend that you create separate SSH keys specifically for Semaphore deployment.

Generate new, passwordless key pair with `ssh-keygen -t rsa` command and then add the newly created private key to Semaphore.

The public key should be added to your server, to the `.ssh/authorized_keys` file, inside the user’s home directory which is used for deploying.

Through these steps you give Semaphore permission to access your server through your Capistrano script and successfully execute deploy commands.

**Note:** The private key will be encrypted on Semaphore and will be available only during the deployment process. After the initial setup there is no way to change it through Semaphore interface. You can identify it with the fingerprint on the project settings page.

If you are using port forwarding with Capistrano, you will need to make sure that the SSH key which is used on Semaphore is added as a deploy key to the GitHub repository as well.

## Naming your server on Semaphore

<img src="/docs/assets/img/deploying-with-capistrano/server-name.png" width="600">

Here you just give your server a name, which can be anything you like. It will be used on your Semaphore dashboard and deployment timeline.

Each server has its own _alias_ which represents server's name in a safe string form. The alias is also available in the deploy environment via `SEMAPHORE_SERVER_NAME` environment variable.

By now the setup is complete - you are ready to automatically deploy to your server(s).
