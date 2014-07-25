---
layout: post
title: Deploying to Heroku
category: Deploying your application
---

With Semaphore it's very easy to set up continuous deployment of applications hosted on [Heroku](https://www.heroku.com/). You only need to make sure that you have a configured application on Heroku and a corresponding project on Semaphore.

To get started, go to your project's settings and under "Deployment" tab follow the link to add a new server.

<img src="/docs/assets/img/deploying-to-heroku/settings.png" class="img-responsive">

This will launch a simple 5-step process.

## Choosing your deployment method

The first step is to select Heroku as your deployment method.

<img src="/docs/assets/img/deploying-to-heroku/deployment-method.png" class="img-responsive">


## Choosing your deployment strategy

<img src="/docs/assets/img/deploying-to-heroku/deployment-strategy.png" class="img-responsive">

There are two deployment strategies on Semaphore: "automatic" and "manual".

**Automatic** means that a deploy will be triggered after every passed build on the selected branch. Besides that, you can also manually deploy any build from any branch at any time.

**Manual** strategy requires manual selection of builds to deploy.

For automatic deployment you will be asked to select which branch will be automatically deployed after each passed build.

**Note**: You can easily change the deployment strategy from server settings at any time after the setup is complete.

## Providing Heroku API token

<img src="/docs/assets/img/deploying-to-heroku/heroku-api-key.png" class="img-responsive">

At this point you need to paste your Heroku API token. You can find it under [account information](https://dashboard.heroku.com/account) on the Heroku dashboard.

By providing your Heroku API token, you authorize Semaphore to configure and set SSH keys that are needed for deployment.

## Choosing the target Heroku application

<img src="/docs/assets/img/deploying-to-heroku/select-heroku-application.png" class="img-responsive">

After you select your application from the list, Semaphore will generate and set new pair of SSH keys for you:

- Private key will be encrypted and stored on Semaphore; it will be available to you in deployment enviroment.
- Public key will be added to your application's deploy keys on Heroku.

This means that Semaphore will set up everything that you need for deployment on Heroku, including [Heroku toolbelt](https://toolbelt.heroku.com) which allows you to run any Heroku command during deployment.

## Naming your server on Semaphore

<img src="/docs/assets/img/deploying-to-heroku/server-name.png" class="img-responsive">

In this step you need to provide a name for your server, which can be any name you like. It will be used on your Semaphore dashboard and deployment timeline.

Each server has its own _alias_ which represents server's name in a safe string form. The alias is also available in the deploy environment via `SEMAPHORE_SERVER_NAME` environment variable.

By now the setup is complete - you are ready to automatically deploy to Heroku.

## Additional commands

If your application requires some additional deploy commands (such as running migrations after deploy) you can edit the default commands on the summary page or in project settings under "Deployment" tab.

**Note:** Heroku toolbelt doesn't propagate [exit status code](/docs/failed-heroku-db-migration-reported-as-passed.html), which leads to
reporting a deploy with a failed Heroku toolbelt command as passed.
