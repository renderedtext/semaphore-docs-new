---
layout: post
title: Running a build command on a specific branch
category: Customizing your build
---

Branch name is available as an [enviroment variable](/docs/available-environment-variables.html) `BRANCH_NAME`. You can add a new [build command](/docs/customizing-build-commands.html) that will check the branch name, e.g:

```bash
if [ "$BRANCH_NAME" = "acceptance-tests" ]; then bundle exec rake spec:acceptance ; fi
```
