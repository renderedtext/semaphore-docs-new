---
layout: post
title: Pushing to Bitbucket doesn't always trigger a build
category: Build troubleshooting
---

When a fast-forward push or merge is posted to the repository on Bitbucket,
post-receive hooks are not created and thus the build is not triggered. This is
a Bitbucket issue and it can be followed and commented on in [this issue thread](https://bitbucket.org/site/master/issue/7775/post-service-does-not-provide-useful).

Fast-forward merges happen when a new branch is created and merged while the
source branch is not changed. A visual representation can be found [here](https://confluence.atlassian.com/display/BITBUCKET/Git+fast+forwards+and+branch+management).

To avoid this pitfall, use the `--no-ff` flag when merging branches. The example
below shows the merging of a feature branch into the master branch.

```
git checkout master
git merge feature-1 --no-ff
```

To avoid the need to ask other git users to make any changes to their local or 
global environment, and prevent accidental fast-forward merges you can configure 
your repository to never fast-forward a branch. The example below disables 
fast-forwarding for the `master` branch, by creating/updating `.gitconfig` in 
your project root.

```
git config --file .gitconfig branch.master.mergeoptions "--no-ff"
```
