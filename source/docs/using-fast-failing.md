---
layout: post
title: Using Fast Failing
category: Adapting Semaphore to your workflow
---

On Semaphore, fast failing means that you get instant feedback when a job fails.
All the running jobs of a build are stopped as soon as one of the jobs fails.
This means that you don’t need to wait for all the other jobs to finish in order
to get build feedback.

You can select the type of fast failing in the branch settings of your project.
You can either enable it for all branches, or for all branches except the
default one.

<img src="/docs/assets/img/settings/fast-failing-branch-settings.png" class="img-responsive">

You can also explicitly enable or disable fast failing for a specific build
through its commit message (therefore ignoring the existing fast failing
settings). You can enable it by adding `[fast failing]` to the commit message,
or disable it by adding `[fast failing skip]` or `[skip fast failing]`.
