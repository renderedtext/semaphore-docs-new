---
layout: post
title: Caching between builds
category: The Semaphore platform
---

Installing application dependencies can take a significant amount of time, so Semaphore caches them to make your build time shorter. Dependency directories for Ruby, Node.js and Clojure projects are currently cached by default. The full list of cached directories, relative to your repository is as follows:

```
.bundle
vendor/bundle
node_modules
bower_components
.semaphore-cache
~/.m2
```

Generic cache directory `.semaphore-cache` is located in `/home/runner/your-app/.semaphore-cache`. The full path is available in `SEMAPHORE_CACHE` environment variable. In case you need to download a lot of dependencies it's a good idea to keep them in this cache directory.

We try to keep our cache hit percentage high. At the moment it is around 90%. So in case of writing a custom builds script that facilitates Semaphore cache keep in mind that it might be a miss. Getting to 100% hit rate is our short term goal.

If we are not caching packages of your favourite language, please [let us know](mailto:semaphore+docscachepage@renderedtext.com) how you are using them and we will expand our system.
