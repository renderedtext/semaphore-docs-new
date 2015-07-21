---
layout: post
title: Code Climate
category: Integrations
---

Code Climate is Semaphore's partner for providing test coverage reports for Ruby apps. Data is sent from your builds on Semaphore. To set it up:

- [Sign up for Code Climate](https://codeclimate.com/partners/semaphore). Semaphore customers receive 20% off their first three months.

- Add the codeclimate-test-reporter gem to your `Gemfile`:

```ruby
gem "codeclimate-test-reporter", group: :test, require: nil
```

- Start the test reporter **on the very first line** of `spec_helper.rb` or `test_helper.rb`:

```ruby
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
```

- Set your CODECLIMATE\_REPO\_TOKEN environment variable. In Semaphore, this is done using the form located at **Project Settings > Integrations > Code Climate**. To find your repo token on Code Climate, click on **Set Up Test Coverage** on the right-hand side of your repository's feed. You will then see a code block similar to:

<pre>
$ CODECLIMATE_REPO_TOKEN=<b>0e9f8b1974bf87a6fdbc25747fafe7adfeffc372575483f37c68056c841ba2d2</b> bundle exec rake
</pre>

**Note:** Only copy the bold portion of the above code block.
