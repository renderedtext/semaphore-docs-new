---
layout: post
title: Using database from a Ruby or Rails application
category: Ruby
---

When a database engine is selected in project settings, Semaphore will
generate a file `config/database.yml` with working database
access credentials.

For Rails apps, project analysis also generates `bundle exec rake db:setup` and
`bundle exec rake db:test:prepare` into your build commands, which is enough for
things to just work in most cases.

Semaphore does not create the database before your build begins. It is up to
your build commands to do so.
