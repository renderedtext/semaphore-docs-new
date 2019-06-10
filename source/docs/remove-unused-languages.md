---
layout: post
title: Removing unused languages to gain more free disk space
category: Customizing your build
---

If you see `no space left on device` message in command log, meaning the disk is
full, you can free up some space in the Semaphore Classic environment Standard
and Docker platform (but not Docker Light). This can be done by adding the
following command to the setup of the build:

```
wget https://raw.githubusercontent.com/renderedtext/semaphore-scripts/master/remove-unused-languages.sh  && bash remove-unused-languages.sh
```

It will remove some of the unused languages while preserving the language
version selected in the project settings.
