---
layout: post
title: Building projects that take longer than 60 minutes
category: Build troubleshooting
---

Semaphore automatically halts the build if a command takes longer than an hour – in most cases so far it has been a sign of something going wrong, like a debugger statement left in source code.

But if your build really takes longer than an hour, you can you try running the specs or scenarios in two or more commands, eg:

```bash
bundle exec cucumber features/shopping_cart/*
bundle exec cucumber features/reporting/*
bundle exec cucumber features/something_else/*
```

You can then leverage Semaphore’s [build parallelization feature](https://semaphoreci.com/blog/2012/10/25/semaphore-can-now-parallelize-your-builds.html) and run these simultaneously.
