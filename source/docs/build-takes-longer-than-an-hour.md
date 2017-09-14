---
layout: post
title: Building projects that take longer than 60 minutes
category: Build troubleshooting
---

By default, Semaphore automatically halts the build if a command takes longer than an hour.
This is to prevent cases like having left a debugger statement in the source code.

You can extend this timeout if needed.
As project admin, go to project settings > Admin tab, and within "Build options"
select the desired value of "Command timeout".
Options range from 15 minutes to 180 minutes.

