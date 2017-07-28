---
layout: post
title: Building pull requests
category: Getting started
---

Semaphore supports building pull requests from forked repositories for projects
hosted on GitHub. Every time a new pull request is opened, Semaphore creates
a new branch whose name matches the pull request title and number.

<img src="/docs/assets/img/building-pull-requests/pull-requests.png" class="img-responsive">

Since Semaphore automatically builds branches that are created within a
repository, it doesn't support building pull requests that are opened within the
same repository.

Because of technical limitations of its API, Semaphore does not support building
pull requests for projects that are hosted on Bitbucket.
