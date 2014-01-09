---
layout: post
title: How to skip building some commits?
category: Customizing your build
---

If you'd like your commit, or a series of commits that you're pushing, to not
trigger a build, just write `[ci skip]` somewhere in your commit's
message.

To turn off or filter automatic builds on new branches. You can either turn off automatic builds of new branches, or you can specify a whitelist of allowed regular expressions. In that case a new branch will be built only if it matches one of the entries. You'll find this in your project settings.
