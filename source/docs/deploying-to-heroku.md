---
layout: post
title: Deploying to Heroku
category: Deploying your application
---

With Semaphore it's very easy to set up continuous deployment of applications
hosted on [Heroku](https://www.heroku.com/). You only need to make sure that you
have a configured application on Heroku and a corresponding project on
Semaphore.

To get started, find your desired project and follow "Set Up Deployment" link
under branches list.

<img src="/docs/assets/img/deploying-to-heroku/set-up-deployment.png" alt="Set Up Deployment" class="img-responsive img-bordered">

This will launch a simple 5-step process.

## Choosing your deployment method

The first step is to select Heroku as your deployment method.

<img src="/docs/assets/img/deployment-method.png" alt="Deployment Method" class="img-responsive img-bordered">

## Choosing your deployment strategy

<img src="/docs/assets/img/deploying-to-heroku/deployment-strategy.png" alt="Deployment Strategy" class="img-responsive img-bordered">

There are two deployment strategies on Semaphore: "automatic" and "manual".

**Automatic** means that a deploy will be triggered after every passed build on
the selected branch. Besides that, you can also manually deploy any build from
any branch at any time.

**Manual** strategy requires manual selection of builds to deploy.

For automatic deployment you will be asked to select which branch will be
automatically deployed after each passed build.

**Note**: You can easily change the deployment strategy from server settings at
any time after the setup is complete.

## Providing a Heroku API key

<img src="/docs/assets/img/deploying-to-heroku/heroku-api-key.png" alt="Heroku API key" class="img-responsive img-bordered">

At this point you need to paste your Heroku API key. You can find it under
[account information](https://dashboard.heroku.com/account) on the Heroku
dashboard.

By providing your Heroku API key, you authorize Semaphore to configure and set
SSH keys that are needed for deployment.

## Choosing the target Heroku application

<img src="/docs/assets/img/deploying-to-heroku/select-heroku-application.png" alt="Select Heroku application" class="img-responsive img-bordered">

After you select your application from the list, Semaphore will generate and set
new pair of SSH keys for you:

- Private key will be encrypted and stored on Semaphore; it will be available to
you in deployment environment.
- Public key will be added to your application's deploy keys on Heroku.

This means that Semaphore will set up everything that you need for deployment on
Heroku, including [Heroku toolbelt](https://toolbelt.heroku.com) which allows
you to run any Heroku command during deployment.

## Naming your server on Semaphore

<img src="/docs/assets/img/deploying-to-heroku/server-name.png" alt="Server Name" class="img-responsive img-bordered">

In this step you need to provide a name for your server, which can be any name
you like. It will be used on your Semaphore dashboard and deployment timeline.
During this step, you may also choose to set a server URL for quick access to
wherever you are deploying your application.

Each server has its own _alias_ which represents server's name in a safe string
form. The alias is also available in the deploy environment via
`SEMAPHORE_SERVER_NAME` environment variable.

By now the setup is complete - you are ready to deploy to Heroku.

## Additional commands

If your application requires some additional deploy commands (such as running
migrations after deploy) you can edit the default commands by editing the related server
on the server page for your project.

## Propagating exit status codes

Heroku toolbelt doesn't propagate exit status codes by default. This may result
in a failed deploy to be reported as passed. A common example is the failure of
a `db:migrate` task. This is because for Semaphore a command has failed if its
exit status code is != 0 (zero means success).

To make a Heroku command propagate the exit code up to Semaphore, use the
`--exit-code` option: `heroku run --exit-code -- COMMAND`.
For example, the following command will correctly report the exit code of a
database migration in Rails.

```
heroku run --exit-code -- bundle exec rake db:migrate
```

See the `heroku help run` command for more details.
