---
layout: post
title: Build fails with “file not found db:create (ArgumentError)”
category: Build troubleshooting
---

Upgrade shoulda gem, or add `:require => false` to it in Gemfile, or add test-unit gem to your Gemfile. More info [here](http://stackoverflow.com/a/9571551) and [here](http://stackoverflow.com/questions/7957330/ruby-1-9-3-breaks-rake-test)
