---
layout: post
title: Interpreting Insights data
category: Insights
---

After you have enabled Insights on your project for the frameworks you use and
ran a successful build, you will have a report on your slowest test files. You
can see the report by clicking **Add-ons** link on the project page and then
following the **Insights** link.

From the _Insights_ page, you choose a framework for which you want to see the
report. For example, if you want to see which RSpec files are the slowest in
your test suite, when you follow the **RSpec** link, you will see a table like
the one in the picture below.

image

## Report data
The table contains all test files which take more than a minute to run, and if
none such are found then the slowest five are shown by default.

Here you can see the maximum and average running time of the listed files. You
can also see how often did the test file pass.

Each table row can be expanded to show more info on the file's build history.
Bar height indicates running time and build outcome is color-coded. The data
in the report is based on the last 50 builds.

image

## How to use Insights data to enhance your tests
If you notice some test files with lower build pass rate and you're not sure
why that keeps happening, it is possible that your test suite contains a flaky
test. You can check out [this
article](https://semaphoreci.com/community/tutorials/how-to-deal-with-and-eliminate-flaky-tests)
to find out how you may eliminate them.

Another thing is that you may have some test files which are significantly
slower than the rest of the suite. This can happen by writing tests that make
excessive database calls or similar inefficient use of resources.

It can become a problem if you have a test file that takes 5 minutes to
complete, then your whole build cannot complete sooner than 5 minutes, plus
some setup and teardown operations that may exist for your project.

Semaphore Community has some articles which can help you learn more about
writing good specs:
- [Learn RSpec](https://semaphoreci.com/community/series/learn-rspec)
- [Working Effectively with Data Factories Using
FactoryGirl](https://semaphoreci.com/community/tutorials/working-effectively-with-data-factories-using-factorygirl)
- [Stubbing External Services in
Rails](https://semaphoreci.com/community/tutorials/stubbing-external-services-in-rails)

## Further reading
- [Insights troubleshooting](/docs/insights/insights-troubleshooting.html)
