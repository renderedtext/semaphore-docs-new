---
layout: post
title: Failed Heroku db:migrate reported as passed
category: Build troubleshooting
---

For Semaphore, a command has failed if its exit status code is != 0 (zero means success).

Using the Heroku toolbelt, the `heroku run --exit-code -- COMMAND` command will propagate the exit code of `COMMAND` up to Semaphore. For example, the following command will correctly report the exit code of a database migration in Rails.

```
heroku run --exit-code -- bundle exec rake db:migrate
```

See the `heroku help run` command for more details.
