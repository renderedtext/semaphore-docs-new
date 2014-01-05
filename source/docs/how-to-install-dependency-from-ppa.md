---
layout: post
title: How to install a dependency from PPA?
category: Managing dependencies
---

Ubuntu's Personal Package Archives (PPA) can be used to install a package
that is unavailable from the official repository.

Add a PPA and install a package with following 3 [custom build
commands](/docs/customizing-build-commands.html):

<img src="/docs/assets/img/how-to-install-dependency-from-ppa/ppa.png" class="img-responsive">

__Note:__ An `-y` option must be used in order to prevent APT from
requesting an input and blocking a build.
