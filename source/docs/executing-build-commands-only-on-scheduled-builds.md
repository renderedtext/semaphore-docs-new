---
layout: post
title: Executing build commands only on scheduled builds
category: Customizing your build
---

If you wish to run builds on scheduled time only, not on each commit, it is possible to do by establishing an execution logic based on the trigger source. If using this approach, it's recommended to create scripts for setup, job and after job commands. This way, it will be easier to control the execution and only one IF statement per command set (setup, job, after job) would be enough:

```bash
# Setup section
if [ $SEMAPHORE_TRIGGER_SOURCE = "scheduler" ]; then bash setup_commands.sh; fi

# Job section
if [ $SEMAPHORE_TRIGGER_SOURCE = "scheduler" ]; then bash job_commands.sh; fi

# After job section
if [ $SEMAPHORE_TRIGGER_SOURCE = "scheduler" ]; then bash after_job_commands.sh; fi
```

__Note:__
Every commit to a given branch would still trigger the build, but the scripts would execute only if the build is triggered by a scheduler.

Also, it's recommended to create a new project with only the branch that is needed. Disabling the automatic builds of new branches is strongly advised, to keep the number of triggered builds at a minimum. You may disable the automatic builds of new branches by going to **Project Settings > Branches** and setting the **Build new branches** dropdown list value to **Never**.
