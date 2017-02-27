---
layout: post
title: Splitting your test suite with Test Boosters
category: Test Boosters
---

Before you start, you should have Insights report on build duration. This
information is necessary to make better suggestions when splitting your test
suite. You can read about enabling Insights [here](/docs/insights/enabling-insights.html).

Test Boosters feature is located in _Add-ons_ section on project page.

<img src="/docs/assets/img/test_boosters/project_header.png" alt="Add-ons
feature" class="img-responsive img-bordered">

Next, click on **Test Boosters**.

<img src="/docs/assets/img/test_boosters/tb_add_on.png" alt="Test Booster
feature" class="img-responsive img-bordered">

When you follow the link, you will see a list of currently supported
frameworks.

<img src="/docs/assets/img/test_boosters/framework_list.png" alt="Framework
list" class="img-responsive img-bordered">

Like Insights, Test Boosters work for the frameworks you use in your project.
So if you use both Cucumber and RSpec, you can choose to split only one type of
test files, or both.

When you click the **RSpec** link, assuming you have a previously generated
Insights report for RSpec, you will see a slider similar to the one in the
screenshot below.

<img src="/docs/assets/img/test_boosters/tb_slider.png" alt="Framework
list" class="img-responsive img-bordered">

## Adjusting Test Boosters slider

The white circle in the slider indicates the predicted optimal number of
threads and running time, based on your Insights report.

As you drag the slider, the estimated run time per thread is shown above the
slider. You can choose the number of threads you think is best regarding your
current needs and subscription plan.

The estimates are made based on your Insights report and may vary as your test
suite changes. Generally, Test Boosters can make better estimates if you have
more entries in your Insights report history.

As you move the slider to the right, if you exceed the number of threads
available on your current subscription plan, you will see a horizontal bar
below the slider with information on your current thread usage.

<img src="/docs/assets/img/test_boosters/tb_upgrade_plan.png" alt="Test
Boosters usage bar" class="img-responsive img-bordered">

The blue color indicates the number of build threads you currently use when
building your projects. These are the threads you have entered on project
settings page and it is the number of threads which appear on your build page.

Test Booster threads are marked by red color in this bar to differentiate them
from the rest of the threads you use. To read more about Test Booster threads,
how they relate to the usual build threads, and how they impact your build
settings, check out [this](/docs/test_boosters/test-booster-threads.html)
section.

The number of available threads can be increased by upgrading your subscription
plan or deleting some of your existing build threads. You should note that
Semaphore won't automatically delete any of your current threads in the process
of setting up Test Boosters.

<img src="/docs/assets/img/test_boosters/start_build.png" alt="Start build"
class="img-responsive img-bordered">

When you click **Select** you will see the _Start build_ option. This will
build your project's latest code revision with the selected number of Test
Booster and all the build threads you already had.

<img src="/docs/assets/img/test_boosters/start_build_tip.png" alt="Start build
tip" class="img-responsive img-bordered">

The same applies for splitting Cucumber test files.
