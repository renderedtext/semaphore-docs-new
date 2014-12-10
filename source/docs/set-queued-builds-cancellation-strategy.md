---
layout: post
title: Set queued builds cancellation strategy
category: Customizing your build
---

Semaphore supports 2 cancellation strategies for queued builds on a single branch 
- default and cancel queued builds.

With *default strategy*, Semaphore will build every push to the code repository
as they arrive to Semaphore. If you push few times to a single branch in a short
time span, builds will be queued and built in order.

With *cancel queued builds strategy*, if you push few times to a branch you
don't have to wait for all builds to complete to get the build results of the
last code version. Instead, queued builds will be cancelled and only the most
recent version of the code will be tested.

You’ll find the screen to configure this in your project settings, Branches tab.

<img src="/docs/assets/img/settings/settings-branches.png" class="img-responsive">
