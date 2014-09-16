---
layout: post
title: JavaScript
category: Languages
---

Semaphore provides support for testing and deploying JavaScript projects via
Node.js. The following Node.js versions are available via [NVM](https://github.com/creationix/nvm):

- 0.8.26
- 0.10.26
- 0.11.11

The Semaphore stack includes:

- [NPM](https://www.npmjs.org/) (1.4.3)
- [Grunt](http://gruntjs.com/) (0.1.13)
- [Bower](http://bower.io/) (1.2.8)

List of all packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.

The version specified in project settings will be set as global before your build commands run. Semaphore uses [NVM](https://github.com/creationix/nvm) for managing Node.js versions.

Setting Node.js version is performed by the equivalent of the following command:

    nvm use 0.10
