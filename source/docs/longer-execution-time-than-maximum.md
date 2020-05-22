---
layout: post
title: Longer execution time than Semaphore Classic maximum
category: Adapting Semaphore
---

Semaphore Classic has a hard limit of task running maximum 3 hours. If your 
project needs to run a non-trivial task that takes more than 3 hours to finish,
the timeout on Semaphore Classic can be increased to maximum of 3 hours in 
`Project Settings > Admin`. Splitting a non-trivial task to two subtasks would 
allow for each running up to 3 hours.
