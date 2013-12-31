---
layout: post
title: Build fails on db:setup
category: Build troubleshooting
---

Make sure that while Rails environment is being loaded, no database queries are
executed.

For example, code in a factory that is querying the database will be executed during
environment load:

```ruby
factory :foo_factory do
  FooBar.find_by_attribute('foo')
end
```

Another place where this may happen are initializers. If one of your initializers
is referencing something like `Post.first`, that will not work in a clean CI
environment.

## Explanation

During a build on Semaphore, a new test database is being created from the
scratch. This means that while the Rails environment is loading, database
does not yet exist. Therefore making queries to database will cause the build
to fail early.

## Reproducing locally

This may not appear locally because the test database already exists,
so querying the database during the environment initialization does not
not cause tests to fail. However you can reproduce this behaviour locally
by dropping the test database.
