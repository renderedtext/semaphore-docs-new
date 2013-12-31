---
layout: post
title: How to switch Ruby version in a specific branch
category: Customizing your build
---

As with [running branch-specific commands](/how-to-override-build-commands):

```bash
if [ "$BRANCH_NAME" = "ruby-2" ]; then rbenv local 2.0.0-p247 ; fi
```

You can find the list of available Ruby versions on our [suppoted application stack](/supported-stack) page.
