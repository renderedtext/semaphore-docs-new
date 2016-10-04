---
layout: post
title: How Semaphore scheduler works
category: Adapting Semaphore to your workflow
---

Every build, deploy and SSH session on Semaphore pass through the scheduler
&mdash; a component that keeps track of the order of your builds
and assigns [Boxes](https://semaphoreci.com/pricing) to your jobs.

The scheduler manages the state of your builds, deploys and SSH sessions, and
pushes them through several phases before execution.

## First phase: Registration in the scheduler

On creation, builds, deploys, and SSH sessions are registered in the scheduler.

The newly registered builds wait for all the previous builds to finish on the
branch they belong to. If you have enabled one of the
[cancellation strategies](/docs/set-queued-builds-cancellation-strategy.html) on
your branch, the scheduler will cancel all the previous builds and thus reduce
the time needed for your build to start.

When every previous build is finished on the branch, the build is pushed to
the next phase, where it will wait for available Boxes on which its jobs will be
executed.

Deploys behave similarly to builds in this phase. They wait for all the
previous deploys to finish on their deployment server, and then they are pushed
to the next phase of scheduling.

SSH sessions are immediately pushed to the next phase.

## Second phase: Waiting for available Boxes

The second phase acts like a priority queue, where builds, deploy and SSH
sessions wait for available Boxes. The order in the queue is based on
creation time and the
[priority rules defined in your project's settings](/docs/set-high-priority-branches.html).

Deploys and SSH sessions, by default, have a higher priority than builds. If you
define a high priority branch in your project's settings, every build on that
branch will also have a higher priority than normal builds on other branches.

Builds, deploys and SSH session are blocked until there are enough available
Boxes to run the whole upcoming build, deploy or SSH session. For example, if
you have a plan that allows 8 concurrent jobs, and three builds with 4 jobs
each, your third build will have to wait for one of the previous builds to finish.

## Third phase: Assigning Boxes to jobs

In the last phase of scheduling, available Boxes are assigned to jobs of
incoming builds, deploys or SSH sessions. The execution of your jobs starts at
this point.

Builds, deploys and SSH sessions stay in this state until they are finished
or stopped.

## Observing the state of the Scheduler

You can observe all the builds, deploys, and SSH sessions in the scheduler by
visiting your organization's Activity Monitor:

<img src="/docs/assets/img/activity-monitor.png" class="img-responsive">
