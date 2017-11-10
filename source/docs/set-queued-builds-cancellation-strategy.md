---
layout: post
title: Set queued builds cancellation strategy
category: Adapting Semaphore to your workflow
---

Semaphore supports 5 cancellation strategies for queued and running builds on
a single branch.

#### Strategy #1: Don't Cancel Queued Builds

Semaphore will build every push to the code repository as they arrive to
Semaphore. This is the default build strategy. If you push few times to a single
branch in a short time span, builds will be queued and built in order.

#### Strategy #2: Cancel Queued Builds

If you push few times to a branch you don't have to wait for all builds to
complete to get the build results of the last code version. Instead, queued
builds will be cancelled and only the most recent version of the code will be
tested.

#### Strategy #3: Cancel Queued Builds Except for the Default Branch

Semaphore will follow the **cancel queued builds strategy** on all branches
except on the default branch. This is ideal for the *master* branch where you
want to make sure that each push is properly tested before it goes into
production.

#### Strategy #4: Cancel Queued and Started Builds

If you push few times to a branch you don't have to wait for all builds to
complete to get the build results of the last code version. Instead, running
builds will be stopped and queued builds will be cancelled. Only the most
recent version of the code will be tested.

#### Strategy #5: Cancel Queued and Started Builds Except for the Default Branch

Semaphore will follow the **cancel queued and started builds** on all branches
except on the default branch. This is ideal for the *master* branch where you
want to make sure that each push is properly tested before it goes into
production.

You’ll find the screen to configure this in your project settings, Branches tab.

<img src="/docs/assets/img/settings/settings-branches.png" class="img-responsive">
