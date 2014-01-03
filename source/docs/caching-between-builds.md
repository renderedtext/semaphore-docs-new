---
layout: post
title: Caching between builds
category: The Semaphore platform
---

Installing application dependencies can take significant amount of time so we cache them to make your build time shorter. Currently we cache directories for Rails and Node.js projects by default. Check list below for complete list of cached directories.

```
   .bundle
    vendor/bundle
    node_modules
    bower_components
    .semaphore-cache
```

Generic cache directory is e.g. `/home/runner/you-app/.semaphore-cache`. Path is available as `SEMAPHORE_CACHE` environment variable. In case you need to download a lot of dependencies it's good idea to keep them in cache directory.

We try to keep our cache hit percentage high. At the moment it is around 90%. So in case of writing a custom builds script that facilitates Semaphore cache keep in mind that it might be a miss. Getting to 100% hit rate is our short term goal.

If we are not caching packages of your favourite language, please [let us know](mailto:semaphore+docscachepage@renderedtext.com) how you are using them and we will expand our system.
