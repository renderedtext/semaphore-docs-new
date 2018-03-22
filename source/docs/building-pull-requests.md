---
layout: post
title: Building pull requests
category: Getting started
---

When monitoring pull requests, Semaphore has two main build workflows:

## Pull requests on the main repository

For direct pushes to the main repository, Semaphore automatically creates a
new build, regardless of whether a pull request has been opened or not.  In
this case, Semaphore does the equivalent of `git checkout <branch-name> && git
reset --hard <commit-id>`.

## Pull requests originating from forks

For pushes to forked repositories, Semaphore will start a build after a pull
request has been opened between the main and the forked repository. The pull
request title and number will appear on the Semaphore project page as a link
to the full build history. For example, branch name on Semaphore will be similar to
`https://semaphoreci.com/my-organization/awesome-project/branches/pull-request-5`.

In this case, Semaphore pulls the the refs/pulls references from the main
repository with `git fetch +refs/pull/<pull-request-number>/head: && git reset
--hard <commit-id>`, a [workflow documented by
Github](https://help.github.com/articles/checking-out-pull-requests-locally/#platform-linux).


After a pull request has been closed, Semaphore will no longer run builds for
that pull request.

Because of technical limitations of the Bitbucket API, Semaphore does not
support building pull requests for projects that are hosted on Bitbucket.
