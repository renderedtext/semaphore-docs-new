---
layout: post
title: Interpreting Insights data
category: Insights
---

After you have [enabled Insights on a
project](/docs/insights/enabling-insights.html) and you've ran a successful
build, you will be able to access a report on your slowest test files. You can
see the report by going to the project page and clicking the **Add-ons** link,
and then following the **Insights** link.

You can choose the framework for which you want to see the report from the
Insights page. For example, if you want to see which Cucumber files are the
slowest in your test suite, if you follow the **Cucumber** link, you will see
a table similar to the one in the screenshot below.

<img src="/docs/assets/img/insights/cucumber_table.png" alt="Cucumber
table" class="img-responsive img-bordered">

## Report data
The table contains all test files which take more than a minute to run, and if
there are no files that fit that description, then the slowest five are shown
by default.

It also includes the maximum and average running time of the listed files. You
can also see how often a test file passed.

Each table row can be expanded to show more info on a file's build history.
Bar height indicates running time, and the build outcome is color-coded. The
data in the report is based on the last 50 builds.

<img src="/docs/assets/img/insights/insights_graph.png" alt="Insights
graph" class="img-responsive img-bordered">

## How to use Insights data to enhance your tests
If you notice some test files with a lower build pass rate and you're not sure
why that keeps happening, it's possible that your test suite contains a flaky
test. You can check out [this
article](https://semaphoreci.com/community/tutorials/how-to-deal-with-and-eliminate-flaky-tests)
to find out how you can eliminate them.

There can also be some test files which are significantly slower than the rest
of the suite. This can happen with tests that make excessive database
calls, or are managing resources in a similar inefficient manner.

This can become an issue if you have a test file that takes 5 minutes to
complete, which means that your whole build cannot complete in less than 5
minutes, plus the time it takes to perform any setup and teardown operations
that may exist for your project.

High values in _Standard deviation_ column usually indicate there is potential
for optimization. Semaphore Community has some articles which can help you
learn more about writing good specs:

- [Learn RSpec](https://semaphoreci.com/community/series/learn-rspec)
- [Working Effectively with Data Factories Using
FactoryGirl](https://semaphoreci.com/community/tutorials/working-effectively-with-data-factories-using-factorygirl)
- [Stubbing External Services in
Rails](https://semaphoreci.com/community/tutorials/stubbing-external-services-in-rails)

## Further reading
- [Insights troubleshooting](/docs/insights/troubleshooting-insights.html)
