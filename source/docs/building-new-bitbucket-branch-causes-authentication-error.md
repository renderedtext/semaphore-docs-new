---
layout: post
title: Building a new Bitbucket branch causes authentication error
category: Build troubleshooting
---

When a branch with no new commits is added to Semaphore, it refuses to build
and asks for a Bitbucket account reauthentication. This happens even though authentication
is not the issue and reauthentication does not fix the problem.

When new commits are pushed to the same branch, Semaphore will build it without
any issues.

This does not seem to happen when the branch is created from the Bitbucket
interface.
