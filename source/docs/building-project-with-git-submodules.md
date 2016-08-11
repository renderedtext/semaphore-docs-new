---
layout: post
title: Building a project with git submodules
category: Managing dependencies
---

In your build commands you should add the following setup commands:

```bash
git submodule init
git submodule update
```

and as after job command add:

```bash
git submodule deinit --force .
```

__Note:__
Make sure that Semaphore has permissions to clone your submodules repo. Please
check documentation about [private
gems](/docs/building-project-with-private-gems.html) where you can find more
information about setting permissions for private repos, if you are using those.
