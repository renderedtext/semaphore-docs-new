---
layout: post
title: How to switch Ruby version in a specific branch
category: Customizing your build
---

As with [running branch-specific commands](/docs/running-build-command-on-specific-branch.html):

```bash
if [ "$BRANCH_NAME" = "ruby-2" ]; then rbenv local 2.0.0-p247 ; fi
```

You can find the list of available Ruby versions on our [supported application stack](/docs/supported-stack.html) page.
