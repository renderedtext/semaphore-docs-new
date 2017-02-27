---
layout: post
title: Test Booster threads
category: Test Boosters
---

Test Booster threads are no different than the usual build threads in terms of
running priority or thread usage in your subscription plan. They only indicate
a thread which runs a portion of your test files.

You cannot change the commands for Test Booster threads. You can see these
threads in project settings labeled as `Test Booster threads`.

<img src="/docs/assets/img/test_boosters/tb_thread.png" alt="Test Booster
thread" class="img-responsive img-bordered">

You can still add some additional build threads for whatever you want, if your
subscription plan allows it. You should probably also remove some of your
existing build threads after [setting up Test Boosters](/docs/test_boosters/splitting-your-test-suite-with-test-boosters.html).

For example, if you had a thread which executes the `bundle exec rake spec`
command, you won't be needing it after you enable Test Boosters for RSpec,
because Semaphore will split all your RSpec files across the selected number of
Test Booster threads. Semaphore won't automatically delete any of your existing
threads, so you should make sure to remove any remaining old threads which
might keep slowing down your builds. If you don't want to remove them, just
edit them and put a `#` in front of each command. That way they won't execute.
