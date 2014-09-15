---
layout: post
title: Clojure
category: Languages
---

Current package versions are listed on the [Supported application stack](/docs/supported-stack.html) page.

The Semaphore stack includes:

- Java
- [Leiningen 2](http://leiningen.org)

Leiningen is the project and build management tool for Clojure. See [its homepage](http://leiningen.org) for more information on how to use it.

Most projects will only need to run `lein test` as their build command. The dependencies will be automatically pulled the first time and [cached](/docs/caching-between-builds.html) for later reuse.
