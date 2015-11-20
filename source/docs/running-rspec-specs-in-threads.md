---
layout: post
title: Running RSpec specs in parallel
category: Customizing your build
---

Semaphore lets you run RSpec specs in [parallel threads](https://semaphoreci.com/parallelism). If you want to get faster feedback from CI then you can try [knapsack](https://github.com/ArturT/knapsack) gem. It will split tests across threads and make sure that tests will run comparable time on each thread.

### Generate knapsack report

- Ensure you've added the `knapsack` gem to your Gemfile.
- Add this line at the bottom of Rakefile:
```
Knapsack.load_tasks if defined?(Knapsack)
```
- Add at the beginning of your spec_helper.rb:

```ruby
require 'knapsack'

Knapsack::Adapters::RspecAdapter.bind
```

- For the first time run all specs at once with enabled report generator. Set up your build command:

<img src="/docs/assets/img/running-rspec-specs-in-threads/knapsack-generate-report.png" class="img-bordered-padding img-responsive">

After tests pass your should copy knapsack json report which is rendered at the end of rspec results. Save it into your repository as `knapsack_rspec_report.json` file and commit. More info about generating report you will find in [knapsack docs](https://github.com/ArturT/knapsack#usage).

### Set up knapsack rspec command

Knapsack supports Semaphore ENVs `SEMAPHORE_THREAD_COUNT` and `SEMAPHORE_CURRENT_THREAD`. The only thing you need to do is set up knapsack rspec command for as many threads as you need. Here is an example:

<img src="/docs/assets/img/running-rspec-specs-in-threads/knapsack-config-threads.png" class="img-bordered-padding img-responsive">

Tests will be split across threads.
