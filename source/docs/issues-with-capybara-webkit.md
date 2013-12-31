---
layout: post
title: I’m having issues with capybara-webkit
category: Build troubleshooting
---

- Check how your configuration compares to our [test app](https://github.com/renderedtext/testapp-capybara-webkit/tree/steak), which is known to pass. The `spec_helper.rb`, for example, should have minimal configuration necessary.

- Do not run `xvfb` – Semaphore does that before each build.

- You can dump the content of the page to file with [save_page](http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Session#save_page-instance_method).

That method would just save content of the page to file and return path to file. After that you can just print content of the file to the stdout and insect it in the build logs. Once you see the content of the page that you are testing I should be much easier to understand what’s going on.

- Make sure your views don’t have scripts such as Google Analytics running in test environment – they will cause timeouts.

We’ve found Selenium and Firefox to be more stable and predictable than Webkit.
