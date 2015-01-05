---
layout: post
title: Tests fail on Semaphore but pass locally
category: Build troubleshooting
---

Headless, clean CI environment may make some tests more vulnerable:

- Double-check if your local development environment has some configuration which was introduced manually and is not available after a fresh repository checkout.
- Check if all your testing gems and configuration are up to date.
- `sleep()` is a common source of [flaky tests](http://www.eurostarconferences.com/blog/2012/10/17/test-leaders-live-webinar-qa-with-simon-stewart).
- Having your tests depend on a certain order of records will probably not work.
- Tests depending on external web services will likely fail at some point – when that service blocks repeated access or becomes unavailable; use [VCR](https://github.com/vcr) to record responses once and play them back every next time
- Avoid mixing mocks with real records.
- Check if your tests are relying on specific domain configuration in `/etc/hosts`. We can add special configuration for you but in general your tests shouldn’t rely on such deep system configuration changes.
- Make sure that your code is not prone to race conditions.

### Ruby and Rails specific

- If using Timecop, remember to reset any changes to time.
- Change the database_cleaner strategy to truncation for specs with `:js => true`.
- With Rails, the `Date` and `Time` objects will ignore the configured Rails timezone in methods like `Date.today` and `Time.now` and actually return the system time. You should use methods like `Date.current` and `Time.current` instead. 
- Increasing Capybara timeout value sometimes helps.
