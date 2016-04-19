---
layout: post
title: Splitting your test suite with Test Boosters
category: Test Boosters
---

Before you start, you should have Insights report on build duration. This
information is necessary to make better suggestions when splitting your test
suite. You can read about enabling Insights [here]().

Test Boosters feature is located in _Add-ons_ section on project page.

addons image

When you follow the link, you will see a list of currently supported
frameworks.

frameworks image

Like Insights, Test Boosters work for the frameworks you use in your project.
So if you use both Cucumber and RSpec, you can choose to split only one type of
test files, or both.

When you click the RSpec link, assuming you have a previously generated
Insights report for RSpec, you will see a slider like the one in the image
below.

test boosters slider for rspec

## Adjusting Test Boosters slider

The white circle in the slider indicates the predicted optimal number of
threads and running time, based on your Insights report.

As you drag the slider, the estimated run time per thread is shown above the
slider. You can choose the number of threads you think is best regarding your
current needs and subscription plan.

As you move the slider to the right, if you exceed the number of threads
available on your current subscription plan, you will see a horizontal bar
below the slider with information on your current thread usage.

bar image

The blue color indicates the number of build threads you currently use when
building your projects. These are the threads you have entered on project
settings page and it is the number of threads which appear on your build page.

Test Booster threads are marked by red color in this bar to differentiate them
from the rest of the threads you use. To read more about Test Booster threads
and how they impact your build settings, check out [this]() section.

The number of available threads can be increased by upgrading your subscription
plan or deleting some of your existing build threads. You should note that
Semaphore won't automatically delete any of your current threads in the process
of setting up Test Boosters.

start build option image

When you click **Select** you will see the _Start build_ option. This will
build your project's latest code revision with the selected number of Test
Booster and your own build threads.

test booster and custom threads tip image

The same applies for splitting Cucumber test files.
