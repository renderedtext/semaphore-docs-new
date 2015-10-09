---
layout: post
title: Running tests in parallel
category: Getting started
---

On Semaphore, your builds run on _processors_, which map to real, dedicated CPUs. A single processor can build one project or branch at a time. With more than one, you can:

- Build multiple projects or branches simultaneously.
- Split big test suites in parallel threads.

Combining these two methods lets you test multiple branches across multiple projects in a fraction of time that they would take.

To split your test suite in multiple parallel threads, simply schedule your build commands in multiple threads:

<img src="/docs/assets/img/running-tests-in-parallel/threads.png" class="img-bordered-padding img-responsive">

### See also

- [Running Cucumber scenarios in parallel](/docs/running-cucumber-scenarios-in-threads.html)
- [Running RSpec specs in parallel](/docs/running-rspec-specs-in-threads.html)
- [Running Minitest tests in parallel](/docs/running-minitest-tests-in-threads.html)
