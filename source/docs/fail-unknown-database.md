---
layout: post
title: "Fail: 'Unknown database 'xyz_test'' or 'FATAL database 'xyx_test' does not exist'"
category: Build troubleshooting
---

The first message usually means that rake db:* tasks have set up the `_development` database and not the `_test` one which is required by the tests. Try adding `RAILS_ENV=test` to your build commands.

In the second case, make sure you have `bundle exec rake db:setup` and `bundle exec rake db:test:prepare` in your build commands, as the test database is not created before the build begins.
