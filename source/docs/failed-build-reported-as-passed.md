---
layout: post
title: Failed build reported as passed
category: Build troubleshooting
---

For Semaphore, a command has failed if its exit status code is != 0 (zero means success).

To see this locally, `echo $?` after a failing `rake spec`.

`rake spec` always returns non-zero on failure – unless there’s eg a code coverage report being hooked up to run after the specs.
