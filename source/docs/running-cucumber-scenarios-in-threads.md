---
layout: post
title: Running Cucumber scenarios in parallel
category: Customizing your build
---

Semaphore lets you run Cucumber scenarios in [parallel threads](https://semaphoreapp.com/parallelism). There are couple of ways to use this great feature:

### 1. Using tags

Run [cucumber tag groups](https://github.com/cucumber/cucumber/wiki/Tags) in separate threads.

```bash
RAILS_ENV=test CTAGS='--tags @tag_name' bundle exec rake cucumber default: features
```

### 2. Groups

You can use gem [cucumber in groups](https://github.com/cloudcastle/cucumber_in_groups) and split your Cucumber features to run them separately.

<img src="/docs/assets/img/running-cucumber-scenarios-in-threads/group_threads.png" class="img-responsive">

### 3. Break by directory structure

You can split execution of scenarios by grouping them in subdirectories.
e.g Let's say you have two directory within features, "foo" and "bar".
Running scenarios from these two subdirectories in parallel threads would be done as follows:

<img src="/docs/assets/img/running-cucumber-scenarios-in-threads/directory_threads.png" class="img-responsive">

__Note__: In order for all the feature steps to be visible from each directory, you have to add the following line to your cucumber.yml file:

```yml
  default: -r features
```

### 4. Parallel Cucumber scenarios with Knapsack gem

If you want to get faster feedback from CI then you can try [knapsack](https://github.com/ArturT/knapsack) gem. It will split tests across threads and make sure that tests will run comparable time on each thread.

### Generate knapsack report

For the first time run all scenarios at once with enabled report generator. Set up your build command:

<img src="/docs/assets/img/running-cucumber-scenarios-in-threads/knapsack-generate-report.png" class="img-responsive">

After tests pass your should copy knapsack json report which is rendered at the end of cucumber results. Save it into your repository as `knapsack_cucumber_report.json` file and commit. More info about generating report you will find in [knapsack docs](https://github.com/ArturT/knapsack#usage).

### Set up knapsack cucumber command

Knapsack supports Semaphore ENVs `SEMAPHORE_THREAD_COUNT` and `SEMAPHORE_CURRENT_THREAD`. The only thing you need to do is set up knapsack cucumber command for as many threads as you need. Here is an example:

<img src="/docs/assets/img/running-cucumber-scenarios-in-threads/knapsack-config-threads.png" class="img-responsive">

Scenarios will be split across threads.
