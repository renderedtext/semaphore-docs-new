---
layout: post
title: Turn off automatic testing of new branches
category: Adapting Semaphore to your workflow
---

Semaphore automatically builds new branches when they are created.

If you want to skip building new branches, visit the project Settings -> Branches page.
There, you can choose never to add new branches to Semaphore or to add branches
from the whitelist. Whitelist is configured as a list of regular expressions. For example:

```
hotfix-.*
```

will match `hotfix-start-build` and create and build the branch on Semaphore, but
skip creating `feature-112-update-user` branch.

You’ll find the screen to configure this in your project settings, Branches tab.

<img src="/docs/assets/img/settings/settings-branches.png" class="img-responsive">
