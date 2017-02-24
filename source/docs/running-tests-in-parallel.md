---
layout: post
title: Running tests in parallel
category: Getting started
---

For every CI job, Semaphore checks out and runs your code inside an isolated
container or virtual machine, called [Box](/pricing). Boxes are powerful,
isolated CI job runners engineered to provide bare metal performance
at the convenience of cloud.

Use your boxes to parallelize a large test suite, or build and deploy multiple
branches across different projects. Semaphore does not limit how you use your
boxes in any way.

To split your test suite into parallel jobs, simply rearrange your build
commands for multiple jobs in your project's settings.

Let's assume that you have a Ruby project with a test suite composed of RSpec
and Cucumber. In addition to that, you also have a number of JavaScript tests
for the front end. Your build settings might look similar to this:

<img src="/docs/assets/img/running-tests-in-parallel/starting-point.png" class="img-responsive">

Here's what you need to do to run RSpec, Cucumber and JavaScript tests in parallel.
First, add a new "Parallel job" near the bottom of the screen:

<img src="/docs/assets/img/running-tests-in-parallel/adding-parallel-job.png" class="img-responsive">

A new job block will appear, with an input field to enter a build command.
Since in this example all the commands we want to run have already been entered,
we'll press the Escape key, and drag and drop the `bundle exec rake cucumber`
command into our new job:

<img src="/docs/assets/img/running-tests-in-parallel/dragging-command.png" class="img-responsive">

You can now rename the job from "Job #2" to "Cucumber" in order to be able to
differentiate between jobs more easily later. This text will also appear on
the pages showing build results. To rename the job, click on "Rename" next to
"Job #2", enter your prefered name, and press Return.

<img src="/docs/assets/img/running-tests-in-parallel/renaming-job.png" class="img-responsive">

Repeating the same for `npm test` gives us a 3-job setup, as shown on the
following screenshot:

<img src="/docs/assets/img/running-tests-in-parallel/final-result.png" class="img-responsive">

From this point on, all new builds will run in three parallel jobs — faster than
if all tests ran sequentially, i.e. one by one. Note that the total build time
duration is now determined by the longest running job.

<img src="/docs/assets/img/running-tests-in-parallel/resulting-build.png" class="img-responsive">


### See also

- [Running Cucumber scenarios in parallel](/docs/running-cucumber-scenarios-in-threads.html)
- [Running RSpec specs in parallel](/docs/running-rspec-specs-in-threads.html)
- [Running Minitest tests in parallel](/docs/running-minitest-tests-in-threads.html)
