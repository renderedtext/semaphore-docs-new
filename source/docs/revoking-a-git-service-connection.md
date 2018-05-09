---
layout: post
title: Revoking a Git Service Connection
category: Git Services
---

To remove your git service connection from Semaphore, go to the Settings->Git Services,
and click on Revoke Access button.

If you've added projects from your GitHub or Bitbucket accounts to Semaphore and
you try to revoke access, you'll see a message "Please remove GitHub/Bitbucket projects
you created first."

<img src="/docs/assets/img/git-services/remove-gh-projects.png" alt="adding gh projects" class="img-responsive img-bordered">

In this case, you have 2 options:

1. Delete the project(s) if you don't need them.

2. If you want to continue building your project(s) on Semaphore, someone from the
Owners team in your organization has to replace user-project association first.
This can be done by visiting Project Settings -> Repository tab, and clicking on
the "Change repository" button in the bottom right corner.
This way, your project(s) This way will become associated with other GitHub/Bitbucket
account. These steps have to be repeated for each project you added to Semaphore.
When you're done with switching repositories, you will be able to revoke access.
