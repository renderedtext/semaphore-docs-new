---
layout: post
title: Using external build servers
category: Build troubleshooting
---

If you have onsite computers that are connected to hardware which need to build the project and test it locally, ideally, it would go:

```bash
github -> onsite build server test -> semaphoreci build -> semaphoreci deploy
```

Semaphore Classic supports GitHub and Bitbucket as a code source, however,  unfortunately, custom servers can not be used. As a workaround, additional repository could be created on GitHub or Bitbucket that would hold your project after it goes through local build and testing phase. This way, you could pull files from this newly created GitHub/Bitbucket repository to Semaphore.
