---
layout: post
title: Clojure
category: Languages
---

The Semaphore stack includes:

- Java (openjdk7 7u25-2.3.10)
- [Leiningen 2](http://leiningen.org) (2.3.4)

List of all packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.

Leiningen is the project and build management tool for Clojure. See [its homepage](http://leiningen.org) for more information on how to use it.

Most projects will only need to run `lein test` as their build command. The dependencies will be automatically pulled the first time and [cached](/docs/caching-between-builds.html) for later reuse.
