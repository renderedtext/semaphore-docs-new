---
layout: post
title: Continuous Integration and Deployment of a Django application from GitHub to Heroku with Semaphore
category: Python
---

In this guide, I will show you how to deploy a Django application to Heroku
using Semaphore. I will be using a barebones, open-source [Django repository](https://github.com/ervinb/django_example)
on GitHub. Feel free to fork it and use it to follow along if you don't have a
project already set up.

The sample application will be deployed automatically by Semaphore each time the
master branch is built successfully. Semaphore let's us easily setup this kind of
deployment which is also known as continuous deployment. With this in place,
we can be sure that we have a working code on our server at all times.

The sample application will be deployed to Heroku. Both [Semaphore](https://semaphoreci.com/docs/python-continuous-integration.html)
and [Heroku](https://devcenter.heroku.com/articles/getting-started-with-python#introduction)
have native support for Python, so setting up a project using these services is
a breeze.

### Requirements

  - Heroku account
  - Semaphore account
  - Python with virtualenv installed on your machine
  - git installed on your machine

### Setting up continuous integration with Semaphore and GitHub

After creating a Semaphore account and hooking it up with your GitHub or BitBucket
account, you are ready to start. The next step is to [add](https://semaphoreci.com/docs/adding-github-bitbucket-project-to-semaphore.html)
the Django project from the list of your available repositories.

<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_project_list.png">

In the following steps, selecting the branch and the account where to add the
project will bring you to the analysis page, where Semaphore determines the
settings for your project. These settings can be [changed at any time in
[Project Settings](https://semaphoreci.com/docs/customizing-build-commands.html).

<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_analysis_complete.png">

Completing the setup will trigger the first build.

<first-build-success>
<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_first_build.png">

### Setting up continuous deployment from Semaphore to Heroku

By installing [heroku-toolbelt](https://toolbelt.heroku.com/debian), you gain
access to [Heroku CLI](https://github.com/heroku/heroku). With this tool, you can
setup your application on Heroku without leaving the comfort of your terminal.

```
$ heroku login
...
Authentication successful.

$ heroku create django-example-semaphore
Creating django-example-semaphore... done, stack is cedar-14
https://django-example-semaphore.herokuapp.com/ | https://git.heroku.com/djang-example-semaphore.git
Git remote heroku added
```

We are ready to configure the deployment to Heroku. Visiting the project's page
on Semaphore will reveal a "Set Up Deployment" button. Semaphore's deploy wizard
will guide you through the process of setting up your first deployment to Heroku.

<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_deployment_destination.png">

Select automatic deployment, as we want every successful build to trigger a new
deploy.

<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_deployment_type.png">

Select the branch which will be tied to the deployment.

<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_deployment_branch.png">

When asked for your Heroku API key, it can be found by going to [account settings](https://dashboard.heroku.com/account)
on Heroku and clicking the "Show API Key" button on the bottom.

Comming back to Semaphore, select the Heroku application to which Semaphore will
deploy your code.

<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_deployment_heroku_app.png">

In the last step, name your deploy server and optionally add an URL.

<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_deployment_server_name.png">

A deploy can be triggered right away. Every new commit to the master branch will
trigger a new build, which if successful, will run the deploy to Heroku.

<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_deployment_setup_complete.png">

To test out the setup, start the deployment.

<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_deployment_first.png">

After the deployment completes, visiting the server's [URL](https://django-example-semaphore.herokuapp.com/)
will present you the Django application running on Heroku.

<img src="/docs/assets/img/languages/python/deploy-django-to-heroku/django_deployment_app_page.png">

After completing these steps, your project has continuous integration and deployment
set up and you can enjoy the [befefits](https://semaphoreci.com/community/tutorials/continuous-integration)
of this agile practice.
