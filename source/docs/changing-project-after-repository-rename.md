---
layout: post
title: Changing the project after repository or organization rename
category: Billing
---

If the project's repository or owning organization has been renamed on GitHub, you will need to delete the project and re-add it to Semaphore. This is because we cache the repository, including the `.git/config` file, which is currently preventing us from pulling new changes.
