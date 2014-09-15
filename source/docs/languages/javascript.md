---
layout: post
title: JavaScript
category: Languages
---

Current package versions are listed on the [Supported application stack](/docs/supported-stack.html) page.

The Semaphore stack includes:

- [NVM](https://github.com/creationix/nvm)
- [NPM](https://www.npmjs.org/)
- [Grunt](http://gruntjs.com/)
- [Bower](http://bower.io/)

The version specified in project settings will be set as global before your build commands run. Semaphore uses [NVM](https://github.com/creationix/nvm) for managing Node.js versions.

Setting Node.js version is performed by the equivalent of the following command:

    nvm use 0.10
