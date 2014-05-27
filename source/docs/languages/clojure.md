---
layout: post
title: Clojure Runtime Support
category: The Semaphore platform
on_homepage: false
---

The Semaphore stack includes:

- Java (openjdk7 7u25-2.3.10)
- Leiningen 2 (2.3.4)

Leiningen is the project and build management tool for Clojure. See [its homepage](http://leiningen.org) for more information on how to use it.

Most projects will only need to run `lein test` as their build command. The dependencies will be automatically pulled the first time and [cached](/docs/caching-between-builds.html) for later reuse.

See other available components in the [supported stack](/docs/supported-stack.html).
