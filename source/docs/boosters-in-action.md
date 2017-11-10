---
layout: post
title: Boosters in action
category: Boosters
---

### Boosters for RSpec

#### Supported versions
Test Boosters currently supports RSpec versions:
...

#### How Boosters run your RSpec tests

Test Boosters CLI runs your RSpec tests using `rspec_booster` command:
```
rspec_booster --job <job>/<job_count>
```
It uses `~/rspec_split_configuration.json` file in order to look for your job configuration.

Assuming you have the following configuration within your `~/rspec_split_configuration.json` file:
```
[
  { "files": ["spec/spec_1.rb", "spec/spec_2.rb"] },
  { "files": ["spec/spec_3.rb", "spec/spec_4.rb"] },
  { "files": ["spec/spec_5.rb", "spec/spec_6.rb"] }
]
```

And you run your specs using the following command:
```
rspec_booster --job 1/3
```

This results in following RSpec command under the hood:
```
bundle exec rspec --format documentation --format json --out /home/<user>/rspec_report.json spec/spec_1.rb spec/spec_2.rb
```

It builds and run RSpec command which output, formatted as json, is then redirected to `~/rspec_report.json`.

#### Pass additional flags to RSpec

If you want to invoke RSpec runner with additional flags you can do it by
specifying them within `TB_RSPEC_OPTIONS` environment variable like following:
```
TB_RSPEC_OPTIONS='--fail-fast=3' rspec_booster --job 4/32
```
This results in following RSpec command under the hood:
```
bundle exec rspec --fail-fast=3 --format documentation --format json --out /home/<user>/rspec_report.json <file_list>
```

#### Customize RSpec configuration used by Boosters
?

### Boosters for Cucumber

#### Supported versions

Test Boosters currently supports Cucumber versions ...

#### How do Boosters run your Cucumber scenarios

Test Boosters CLI runs your Cucumber scenarios using `cucumber_booster` command:
```
cucumber_booster --job <job>/<job_count>
```

This command uses `~/cucumber_split_configuration.json` file in order to
look for your job's split configuration.

Assuming that you have following split configuration located at the $HOME
directory:
```
[
  { "files": ["features/feature_1.feature", "features/feature_2.feature"] },
  { "files": ["features/feature_3.feature", "features/feature_4.feature"] },
  { "files": ["features/feature_5.feature", "features/feature_6.feature"] }
]
```

And you run `cucumber_booster` command:
```
cucumber_booster --job 1/3
```

Under the hood, Boosters command invokes Cucumber with the following
command:
```
bundle exec cucumber features/feature_1.feature features/feature_2.feature
```

At the end of the chain, you have Cucumber run your features.

#### Customize Cucumber configuration used by Boosters

You can customize Cucumber configuration by introducing additional
[profiles](https://github.com/cucumber/cucumber/wiki/cucumber.yml)
within your `cucumber.yml` file. Only make sure you append them
to the default one since Test Boosters run Cucumber like following:
```
bundle exec cucumber <file_list>
```

Test Boosters create separate `semaphoreci` profile within your `cucumber.yml` configuration,
and appends it to the default one. This way your custom defined configuration
stays unmodified. This is handled by our
[semaphore_cucumber_booster_config](https://github.com/renderedtext/cucumber_booster_config) gem which is open sourced.

### Test Boosters gem

### Troubleshooting
