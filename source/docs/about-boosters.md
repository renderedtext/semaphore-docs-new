---
layout: post
title: About Boosters
category: Boosters
tags:
  - ruby
---

### Automatically parallelizing your test suite

As your project and test suite grow, feedback and results from your tests gradually become slower, harming developer productivity. The easiest way to solve this is to run tests in multiple jobs. On Semaphore, each job runs on a separate virtual machine. Boosters enable you to get build results in a few minutes by automatically splitting your tests across multiple jobs.

### How it works

Setting up Boosters doesn’t require introducing any new dependencies to your application or making changes to your source code. Also, Boosters do not require any maintenance. They continually adapt, changing how your tests are split across jobs (machines) as your test suite grows and changes.

Semaphore runs your test files on multiple machines, e.g. if you have 100 test files and each takes 1 minute to execute, if Semaphore runs them across 10 jobs, you should get results in 10 times faster.

In practice, test files have different runtimes, so packing them across jobs in a way that each job takes roughly same amount of time to complete is essential for optimizing your build time. Semaphore Boosters know how to pack your test files into separate jobs based on their duration. They do this based on a history of runtimes for all the files in your test suite.

### Trying out Boosters

For more information on setting up and trying Boosters, check out our
[setting up Boosters documentation](/docs/setting-up-boosters.html).

### Will Boosters affect my current build configuration?

No, while you’re setting up Boosters, your project configuration and your team’s work will not be affected in any way. If you decide to apply Boosters configuration in the final step, only then will your project configuration be changed for all users in your team.

### Are the boxes free?

All the boxes used during the Boosters setup are free. You will only need to upgrade your account if you decide to add more boxes than you have in your current plan.

### On which branch should I run the test?

You can run it on any green branch. It makes sense to use a branch that is not the master branch.

### Which frameworks are supported?

Currently supported Ruby testing frameworks are RSpec and Cucumber.

### Troubleshooting

If any of these jobs turn red, that will not prevent you from continuing to set up Boosters. Also, when you split up your test suite in such a random way, some flakiness in your test suite can be more obvious. That’s something your team will need to take care of.

### Getting started

To learn more and see Boosters in action, [visit this page](https://semaphoreci.com/landers/boosters-rails).
