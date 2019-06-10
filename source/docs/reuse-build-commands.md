---
layout: post
title: Reuse the build commands in other projects on Semaphore Classic
category: Adapting Semaphore
---

If you do not wish to type huge number of commands more than once, but wish to
use them in multiple projects (similar to having .yml project file in your
repository in Semaphore 2.0), reusing project commands in Semaphore Classic is
possible and the idea is to organize commands by using scripts.

For example, you may put all of the commands into a script. Even though your
setup and job scripts might contain many commands, only one command which
executes the script will do the build. You may organize the commands in more
than one script, all depending on your needs.

Apart from being quicker to add them than a build command sequence, you may
reuse them in other projects by simply adding the script files to the
repository.
