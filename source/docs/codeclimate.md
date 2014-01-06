---
layout: post
title: Code Climate
category: Integrations
---

Code Climate is Semaphore's partner for providing test coverage reports for Ruby apps. Data is sent from your builds on Semaphore. To set it up:

- [Sign up for Code Climate](https://codeclimate.com/partners/semaphore). Semaphore customers receive 20% off their first three months.

- Add the codeclimate-test-reporter gem to your Gemfile:

```ruby
gem "codeclimate-test-reporter"
```

- Start the test reporter at the very beginning of spec_helper.rb or test_helper.rb:

```ruby
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
```

- Paste your Code Climate repo token in the form in your project's settings on Semaphore, Integrations > Code Climate tab. To find your repo token on Code Climate, click "Setup Test Coverage" on the right hand side of your repository's feed.
