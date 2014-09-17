---
layout: post
title: Clojure Testing Libraries
category: Languages
on_homepage: false
---

### clojure.test

Clojure is shipped with clojure.test library with basic features for writing
tests. Most projects will only need to run `lein test` as their build command.
The dependencies will be automatically pulled the first time and
[cached](/docs/caching-between-builds.html) for later reuse.

<img src="/docs/assets/img/languages/clojure/lein-test.png" class="img-responsive">

### Expectations

[Expectations](http://jayfields.com/expectations) is described as
"a minimalist's unit testing framework" with the slogan "adding signal,
removing noise".

Easiest way to get started is to add expectations and
[lein-expectations](https://github.com/gar3thjon3s/lein-expectations) to
your `project.clj`:

```
(defproject expectations-playground "0.1.0-SNAPSHOT"
  :description "Playground for exploring Expectations"
  :license {:name "Eclipse Public License"
  :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.1"]
                [expectations "2.0.9"]]
  :plugins [[lein-expectations "0.0.8"]])

```

After that, you can run tests with `lein expectations`:

<img src="/docs/assets/img/languages/clojure/lein-expectations.png" class="img-responsive">

If you use both clojure.test and Expectations in your project, you can run
tests with `lein test` as it will run both clojure.test and Expectations tests.
