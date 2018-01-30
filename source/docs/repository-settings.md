---
layout: post
title: Repository settings
category: Managing dependencies
---

Semaphore allows you to view and edit settings that connect your project with a
remote repository. If you go to Project Settings -> Repository you'll see the following
details:

- repository this project is connected to
- username of repository owner at GitHub/Bitbucket
- username of the Semaphore user whose token is being used for communication with
 GitHub/Bitbucket
- status of repository deploy key at GitHub/Bitbucket
- status of the webhook set on Github/Bitbucket.

<img src="/docs/assets/img/repositor-tab/repository-tab-details.png" class="img-responsive">

### Switching repository

At repository settings page you can switch your remote repository by following
the button "Change Repository" at the bottom right corner. This will guide you to
a page with all the remote repositories that you have access to. After selecting
one, new repository will be assigned to your project. This is very useful when the
current owner of the API token is no longer available.

### Updating deploy key or webhook

Semaphore allows you to update your project's deploy key or webhook, if for
some reason they have been removed from remote service. Whenever the status of
your deploy key or webhook is invalid, an option for reseting these two will be
presented.

### Repository or organization rename

If a project's repository or owning organization has been renamed on GitHub/Bitbucket,
you'll need to switch the repository on Semaphore. This will update the project
deploy key and webhook and clear the dependency cache.
