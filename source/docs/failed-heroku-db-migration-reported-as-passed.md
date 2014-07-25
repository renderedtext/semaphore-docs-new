---
layout: post
title: Failed Heroku db:migrate reported as passed
category: Build troubleshooting
---

For Semaphore, a command has failed if its exit status code is != 0 (zero means success).

Heroku toolbelt command `heroku run` doesn't propagate exit status code:

- [https://github.com/heroku/heroku/issues/186](https://github.com/heroku/heroku/issues/186)
- [https://github.com/heroku/heroku/issues/953](https://github.com/heroku/heroku/issues/953)

This leads to reporting a deploy to Heroku with a failed migration as passed.

A possible solution is the Heroku toolbelt plugin:

- [https://github.com/glenngillen/heroku-exit-status](https://github.com/glenngillen/heroku-exit-status)
