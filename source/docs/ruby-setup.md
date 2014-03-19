---
layout: post
title: Ruby setup
category: Build sequence
---

Semaphore uses [rbenv](https://github.com/sstephenson/rbenv) for managing Ruby versions. You can find more information on the [Ruby runtime support](/docs/languages/ruby.html) page.

Setting Ruby version is performed by the equivalent of the following commands:

    rm -f .rbenv-version .ruby-version
    rbenv global 2.0.0-p451
