---
layout: post
title: Using database from a Ruby or Rails application
category: Ruby
---

In case a database engine in selected in project settings, Semaphore will generate a file `config/database.yml` with working [database access](/docs/database-access.html) credentials.

For Rails apps, project analysis also generates `bundle exec rake db:setup` and `bundle exec rake db:test:prepare` into your build commands, which is enough for things to just work in most cases.

Semaphore does not create the database before your build begins. It is up to your build commands to do so.
