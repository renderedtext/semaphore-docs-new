---
layout: post
title: Set high priority branches
category: Customizing your build
---

With high priority branches you can choose one or more branches that will be
scheduled before others. They can be specified with a list of regular
expressions. For example:

```
hotfix-.*
master
```

will match hotfix-start-build and master as high priority branches.

We recommend setting only one or two branches as high priority since adding more
can make the algorithm insignificant.

You’ll find the screen to configure this in your project settings, Branches tab.

<img src="/docs/assets/img/settings/settings-branches.png" class="img-responsive">
