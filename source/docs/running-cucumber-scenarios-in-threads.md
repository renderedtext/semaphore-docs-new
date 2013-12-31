---
layout: post
title: Running Cucumber scenarios in parallel
category: Customizing your build
---

Semaphore lets you run Cucumber scenarios in [parallel threads](https://semaphoreapp.com/parallelism). There are couple of ways to use this great feature:

- Using tags - Run [cucumber tag groups](https://github.com/cucumber/cucumber/wiki/Tags) in separate threads.

```bash
RAILS_ENV=test CTAGS='--tags @tag_name' bundle exec rake cucumber default: features
```

- Groups - You can use gem [cucumber in groups](https://github.com/cloudcastle/cucumber_in_groups) and split your Cucumber features to run them separately.

<img src="/docs/assets/img/running-cucumber-scenarios-in-threads/group_threads.png" width="600">

- Break by directory structure - You can split execution of scenarios by grouping them in subdirectories.
e.g Let's say you have two directory within features, "foo" and "bar".
Running scenarios from these two subdirectories in parallel threads would be done as follows:

<img src="/docs/assets/img/running-cucumber-scenarios-in-threads/directory_threads.png" width="600">

__Note__: In order for all the feature steps to be visible from each directory, you have to add the following line to your cucumber.yml file:

```yml
  default: -r features
```
