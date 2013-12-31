---
layout: post
title: How to add a native dependency?
category: Managing dependencies
---

If your gem or package requires presence of a native library dependency, here's an algorithm how to track it down.

1. In the backtrace, locate the name of the library your gem needs.
2. Go to [packages.ubuntu.com](http://packages.ubuntu.com) and search for it.
3. Copy the name of the `-dev` library package (eg libfoo-dev).
4. In project settings, add a build setup command `sudo apt-get install -y libfoo-dev`.
