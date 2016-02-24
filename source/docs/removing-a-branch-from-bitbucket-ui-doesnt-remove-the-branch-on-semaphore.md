---
layout: post
title: Removing a Branch from Bitbucket UI Doesn't Remove the Branch on Semaphore
category: Git Services
---

If you create a new branch on Bitbucket, Semaphore will pick it up and start
building it. However, if you remove the branch from Bitbucket user interface,
Semaphore will not automatically remove the branch. This is a Bitbucket issue,
as Bitbucket doesn't deliver a webhook when a branch is removed from the user
interface.

If you remove a branch using a Git command, Semaphore will automatically remove
the branch. Semaphore will also remove a branch automatically after the pull
request is merged, if the branch was removed on Bitbucket.
