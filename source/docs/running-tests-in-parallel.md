---
layout: post
title: Running tests in parallel
category: Getting started
---

On Semaphore, your builds run on _processors_, which map to real,
high-performance, dedicated CPUs. A single processor can build one project or
branch at a time. With more than one processor, you can:

- Build multiple projects simultaneously.
- Build multiple project branches simultaneously.
- Split big test suites into parallel threads for each build of a branch.

Combining these methods lets you test multiple branches across multiple 
projects  in a fraction of the time that they would normally take.

To split your test suite into multiple parallel threads, simply schedule your 
build commands in multiple threads.

Here's how you can set this up in project settings. Let's assume that you have
a Ruby project with a test suite composed of RSpec and Cucumber. In addition to
that, you also have a number of JavaScript tests for the front end. Your build
settings might look similar to this:

<img src="/docs/assets/img/running-tests-in-parallel/starting-point.png" class="img-responsive">

Here's what you need to do to run RSpec, Cucumber and JavaScript tests in parallel.
First, add a new "Parallel thread" near the bottom of the screen:

<img src="/docs/assets/img/running-tests-in-parallel/adding-parallel-thread.png" class="img-responsive">

A new thread block will appear, with an input field to enter a build command.
Since in this example all the commands we want to run have already been
entered, we'll press the Escape key, and drag and drop the `bundle exec rake
cucumber` command into our new thread:

<img src="/docs/assets/img/running-tests-in-parallel/dragging-command.png" class="img-bordered-padding img-responsive">

You can now rename the thread from "Thread #2" to "Cucumber" in order to be able to
differentiate between threads more easily later. This text will also appear on 
the pages showing build results. To rename the thread, click on "Rename" next to 
"Thread #2", enter your prefered name, and press Return.

<img src="/docs/assets/img/running-tests-in-parallel/renaming-thread.png" class="img-bordered-padding img-responsive">

Repeating the same for `npm test` gives us a 3-thread setup, as shown on the
following screenshot:

<img src="/docs/assets/img/running-tests-in-parallel/final-result.png" class="img-responsive">

From this point on, all new builds will run in three parallel threads — faster than
if all tests ran sequentially, i.e. one by one. Note that the total build time
duration is now determined by the longest running thread.

<img src="/docs/assets/img/running-tests-in-parallel/resulting-build.png" class="img-responsive">


### See also

- [Running Cucumber scenarios in parallel](/docs/running-cucumber-scenarios-in-threads.html)
- [Running RSpec specs in parallel](/docs/running-rspec-specs-in-threads.html)
- [Running Minitest tests in parallel](/docs/running-minitest-tests-in-threads.html)
