---
layout: post
title: Connecting a Git Service Account
category: Git Services
---

Currently, Semaphore supports adding repositories from GitHub and Bitbucket. To
connect your Semaphore account to your GitHub or Bitbucket account, follow these
steps:

1. Click on your profile picture in the upper-right corner of the Semaphore homepage
and select "Settings",
2. Choose the "Git Services tab" and click on the appropriate button to connect
your Semaphore account to your GitHub or Bitbucket account,

<img src="/docs/assets/img/git-services/adding-git-services.png" alt="adding git services" class="img-responsive img-bordered">

3.Choose if you'd like to give Semaphore access to public projects only, or both
private and public.

<img src="/docs/assets/img/git-services/public-private-repos.png" alt="public private repos" class="img-responsive img-bordered">

 __Note:__
If you're connecting a Bitbucket account, this step is skipped because Bitbucket only
supports giving access to both private and public repositories at the same time.

After you authorize Semaphore to access your account for the chosen Git service,
you should see that Semaphore has a working connection.

<img src="/docs/assets/img/git-services/working-repo.png" alt="working repo" class="img-responsive img-bordered">

You now have successfully connected your Semaphore account to GitHub. You
can follow the same steps again to connect to Bitbucket.

### Restoring an invalid Git Service Connection

To check if your Git service connection is valid, you can go to the Git Services
tab. If you have an invalid connection, Semaphore will detect this, and offer you the options
to either restore your connection, or remove it.
