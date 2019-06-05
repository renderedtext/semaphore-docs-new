---
layout: post
title: How to build all branches except branches in a blacklist
category: Adapting Semaphore
---

If you’d like to skip building some branches in your project, for example, those containing the pull-request in their name, this can be done by going to **Project Settings > Branch**, setting **Build new branches to From whitelist**, and using a negative regex expression as follows:

`^(?!pull-request).+`

[Editable example on rubular.com](https://rubular.com/r/MNuOlHA2Ek)
