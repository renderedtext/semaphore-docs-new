---
layout: post
title: Running Minitest tests in parallel
category: Customizing your build
---

Semaphore lets you run Minitest tests in [parallel threads](https://semaphoreci.com/parallelism). If you want to get faster feedback from CI then you can try [knapsack](https://github.com/ArturT/knapsack) gem. It will split tests across threads and make sure that tests will run comparable time on each thread.

### Generate knapsack report

- Ensure you've added the `knapsack` gem to your Gemfile.
- Add at the beginning of your test_helper.rb:

```ruby
require 'knapsack'

knapsack_adapter = Knapsack::Adapters::MinitestAdapter.bind
knapsack_adapter.set_test_helper_path(__FILE__)
```

- For the first time run all tests at once with enabled report generator. Set up your build command:

<img src="/docs/assets/img/running-minitest-tests-in-threads/knapsack-generate-report.png" class="img-responsive">

After tests pass your should copy knapsack json report which is rendered at the end of minitest results. Save it into your repository as `knapsack_minitest_report.json` file and commit. More info about generating report you will find in [knapsack docs](https://github.com/ArturT/knapsack#usage).

### Set up knapsack minitest command

Knapsack supports Semaphore ENVs `SEMAPHORE_THREAD_COUNT` and `SEMAPHORE_CURRENT_THREAD`. The only thing you need to do is set up knapsack minitest command for as many threads as you need. Here is an example:

<img src="/docs/assets/img/running-minitest-tests-in-threads/knapsack-config-threads.png" class="img-responsive">

Tests will be split across threads.
