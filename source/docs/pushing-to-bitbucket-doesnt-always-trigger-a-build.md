---
layout: post
title: Pushing to Bitbucket doesn't always trigger a build
category: Build troubleshooting
---

Builds on Semaphore are triggered by hooks from a repository host like
Bitbucket. Depending on the particular implementation of the repository host,
hooks may or may not be created by actions on the repository.

In the case of Bitbucket, when a fast-forward push or merge happens, hooks are
not created and thus the build is not triggered. This is considered to be an
issue and it can be followed on [this issue thread](https://bitbucket.org/site/master/issue/7775/post-service-does-not-provide-useful) on Bitbucket.

Fast-forward merges happen when a new branch is created and merged while the
source branch is not changed. A visual representation can be found [here](https://confluence.atlassian.com/display/BITBUCKET/Git+fast+forwards+and+branch+management).
