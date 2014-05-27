---
layout: post
title: Ruby Runtime Support
category: The Semaphore platform
on_homepage: false
---

Semaphore has the following Ruby versions available via [rbenv](https://github.com/sstephenson/rbenv/):

* 2.1.2
* 2.1.1
* 2.1.0
* 2.0.0-p481
* 1.9.3-p545
* 1.9.2-p320
* ree-1.8.7-2012.02
* JRuby 1.7.12

The version specified in project settings will be [set as global](/docs/ruby-setup.html) before your build commands run.

If you need to install an additional version, please see [this guide](/docs/installing-additional-version-of-ruby.html).

The following tools are also available with any version of Ruby:

* Bundler 1.6.2
* RubyGems 2.2.2

In case a database engine in selected in project settings, Semaphore will generate a file `config/database.yml` with working [database access](/docs/database-access.html) credentials.

See other available components in the [supported stack](/docs/supported-stack.html).
