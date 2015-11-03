---
layout: post
title: Running tests in parallel
category: Getting started
---

On Semaphore, your builds run on _processors_, which map to real,
high-performance, dedicated CPUs. A single processor can build one project or
branch at a time. With more than one, you can:

- Build multiple projects simultaneously.
- Build multiple project branches simultaneously.
- For each build of a branch, split big test suites in parallel threads.

Combining these methods lets you test multiple branches across multiple projects in a fraction of time that they would take.

To split your test suite in multiple parallel threads, simply schedule your build commands in multiple threads.

We will show you how to do this in project settings. Let's assume that you have
a Ruby project with a test suite composed of RSpec and Cucumber. In addition to
that, there are also a number of JavaScript tests for the front-end. Your build
settings might be as on the following screenshot:

<img src="/docs/assets/img/running-tests-in-parallel/starting-point.png" class="img-responsive">

Here's what you need to do to run RSpec, Cucumber and JavaScript tests in parallel.
Near the bottom of the screen, click to add new "Parallel thread".

<img src="/docs/assets/img/running-tests-in-parallel/adding-parallel-thread.png" class="img-responsive">

A new thread block will appear, with an input field to enter a build command.
Since in this example we already have all the commands that we want to run
entered, we'd press the Escape key. Then drag and drop the `bundle exec rake
cucumber` command into this new thread.

<img src="/docs/assets/img/running-tests-in-parallel/dragging-command.png" class="img-bordered-padding img-responsive">

You could then rename the thread from "Thread #2" to "Cucumber", to spot the
difference more easily later. This text will be used on the pages showing build
results as well. To do that, click on "Rename" next to "Thread #2", enter a new
name that you prefer and press the Return key.

<img src="/docs/assets/img/running-tests-in-parallel/renaming-thread.png" class="img-bordered-padding img-responsive">

Repeating the same for `npm test` gives a 3-thread setup as shown on the
following screenshot:

<img src="/docs/assets/img/running-tests-in-parallel/final-result.png" class="img-responsive">

From this point, all new builds will run in three parallel threads — faster than
if all tests ran sequentially, i.e. one by one. Note that the total build time
duration is now determined by the longest running thread.

<img src="/docs/assets/img/running-tests-in-parallel/resulting-build.png" class="img-responsive">


### See also

- [Running Cucumber scenarios in parallel](/docs/running-cucumber-scenarios-in-threads.html)
- [Running RSpec specs in parallel](/docs/running-rspec-specs-in-threads.html)
- [Running Minitest tests in parallel](/docs/running-minitest-tests-in-threads.html)
