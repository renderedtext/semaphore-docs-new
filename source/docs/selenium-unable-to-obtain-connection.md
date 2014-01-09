---
layout: post
title: Selenium tests are unable to obtain connection to Firefox
category: Build troubleshooting
---

Make sure selenium-webdriver gem is at latest available version specified on rubygems.org.

Use

```bash
bundle update selenium-webdriver capybara
```

commit and push the resulting changes to `Gemfile.lock`.
