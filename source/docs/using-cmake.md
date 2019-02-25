---
layout: post
title: Using CMake
category: Managing dependencies
---

If you need the specific [CMake](https://cmake.org/) version in your build, it
can be installed by adding the following command to the setup of your project:

```bash
wget https://raw.githubusercontent.com/renderedtext/semaphore-scripts/master/cmake-install.sh && bash cmake-install.sh <cmake-version>
```

The script will install the CMake version you specify and [cache the installation archive](/docs/caching-between-builds.html)
in the directory defined by `$SEMAPHORE_CACHE_DIR` [environment variable](/docs/available-environment-variables.html).
Each installation archive is differentiated by the version number, so different versions can be kept in
the cache.