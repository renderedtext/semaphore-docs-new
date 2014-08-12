---
layout: post
title: Repository settings
category: Managing dependencies
---

Semaphore allows you to view and edit settings that connect your project with a
remote repository. At project settings, repository tab you can see details of the 
related repository.

This page shows you:

- repository that this project is connected to 
- username of repository owner at GitHub 
- username of the Semaphore user whose token is being used for communication with GitHub 
- status of repository deploy key at GitHub
- status of webhook that is set on Github.

<img src="/docs/assets/img/repositor-tab/repository-tab-details.png" class="img-responsive">

### Switching repository

At repository settings page you can switch your remote repository by following
the button "Change Repository". This will guide you to a page with all your
remote repositories that you have access to. After selecting one, new repository
will be assigned to you project. This is very useful when the current owner of
the API token is no longer available.

<img src="/docs/assets/img/repositor-tab/repository-change.png" class="img-responsive">

### Updating deploy key or webhook

Semaphore allows you to update your project's deploy key or webhook, if, for
some reason they have been removed from remote service. Whenever the status of
your deploy key or webhook is invalid, an option for reseting these two will be
presented.

<img src="/docs/assets/img/repositor-tab/repository-status-bad.png" class="img-responsive">
