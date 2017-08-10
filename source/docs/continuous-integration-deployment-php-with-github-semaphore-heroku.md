---
layout: post
title: Continuous Integration and Deployment of PHP applications from GitHub to Heroku with Semaphore
category: PHP
---

In this post we will show you how to set up continuous integration and deployment
for a simple [Laravel](https://github.com/laravel/laravel) web application through Semaphore.
You can find the application's source code
[on GitHub](https://github.com/ervinb/php-base-app).

### Creating the application on Heroku

You can create a new application on Heroku either on their web interface or
from the command line. If you need custom software in the Heroku instance,
go with the latter.

For deploying a Laravel project to Heroku, we prefer creating the Heroku app from
the [command line](https://devcenter.heroku.com/categories/command-line) with
a [custom build pack](https://devcenter.heroku.com/articles/buildpacks#using-a-custom-buildpack).

```bash
heroku create php-cogs --buildpack https://github.com/winglian/heroku-buildpack-php
```

This installs all dependecies which are needed to properly run a Laravel
application.  Either way, the new application will appear in your "Apps" screen
on Heroku.

<img src="/docs/assets/img/languages/php/heroku-apps.png" class="img-bordered img-responsive">

While you're here, copy your Heroku API key from the Account settings.
Semaphore will need this key to deploy your application.

<img src="/docs/assets/img/languages/php/heroku-account-settings.png" class="img-bordered img-responsive">

### Setting up continuous integration from GitHub to Semaphore

[Sign up for a Semaphore account](https://semaphoreci.com) and connect
with GitHub.

<img src="/docs/assets/img/languages/php/welcome-screen.png" class="img-bordered-padding img-responsive">

If you are working on an open source project, select "Build Public Project".
After receiving access to public information on GitHub, Semaphore will
present you a list of available projects to choose from.

<img src="/docs/assets/img/languages/php/project-list.png" class="img-bordered-padding img-responsive">

After you select a project, Semaphore will analyze it and suggest some common
build commands.

<img src="/docs/assets/img/languages/php/php-analysis.png" class="img-bordered-padding img-responsive">

At this point, you are ready to launch the first build.

<img src="/docs/assets/img/languages/php/build-passed.png" class="img-bordered-padding img-responsive">

Every time you or other people push new code to GitHub, Semaphore will run
a build to test it.

### Setting up continuous deployment to Heroku

Visiting the project page allows you to add a server
to which Semaphore is going to deploy the application.

<img src="/docs/assets/img/languages/php/deployment-setup.png" class="img-bordered-padding img-responsive">

Choose Heroku from supported deployment methods.

<img src="/docs/assets/img/languages/php/deployment-method.png" class="img-bordered-padding img-responsive">

The deployment can be automatic or manual. In the spirit of continuous delivery,
we'll go with automatic deployment.

<img src="/docs/assets/img/languages/php/deployment-strategy.png" class="img-bordered-padding img-responsive">

Next, we need to choose the branch which we want to automatically deploy after a successful build.

<img src="/docs/assets/img/languages/php/choose-branch-heroku.png" class="img-bordered-padding img-responsive">

After that, we will paste our Heroku API key.

<img src="/docs/assets/img/languages/php/api-key-heroku.png" class="img-bordered-padding img-responsive">

Select the Heroku application which we want to deploy.

<img src="/docs/assets/img/languages/php/choose-app-heroku.png" class="img-bordered-padding img-responsive">

Finaly, we need to enter a name for our deployment server. Semaphore will
provide a generic name, but it's preferable to replace it with a meaningful one.

<img src="/docs/assets/img/languages/php/server-name-heroku.png" class="img-bordered-padding img-responsive">

Clicking the Create Server button will finish the deployment setup. Semaphore now
has all the information it needs to automatically deploy your application.

<img src="/docs/assets/img/languages/php/deployment-summary.png" class="img-bordered-padding img-responsive">

After we have completed the steps above, we're ready to deploy our Heroku
application.

<img src="/docs/assets/img/languages/php/deploy-passed.png" class="img-bordered-padding img-responsive">

Now every time you push a new commit to Github and all tests pass,
Semaphore will deploy the new version of your application to Heroku.
Of course, you or any of your collaborators can always trigger the deployment
manually on the build page of a branch. This is especially useful when you need
to deploy a feature branch to a staging server.

One thing to note is that by default many projects include
the `composer.lock` file in `.gitignore` but that way deploying to Heroku
will not work, so it's a good idea to remove it from there.

<img src="/docs/assets/img/languages/php/laravel-landing-window.png" class="img-bordered img-responsive">

That's it. Make something awesome and rest assured that your application will
automagically reach its audience. Happy building!
