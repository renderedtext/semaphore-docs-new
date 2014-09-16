---
layout: post
title: PHP
category: Languages
---

Semaphore supports the following PHP versions via [phpbrew](http://phpbrew.github.io/phpbrew/):

- 5.3.28
- 5.4.28
- 5.5.12

The Semaphore stack includes:

- [Composer](https://getcomposer.org/)
- [PEAR](http://pear.php.net/)
- [PECL](http://pecl.php.net/)
- [PHPunit 4.1](http://phpunit.de/)

List of all packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.

The major version specified in project settings will be set as global to the latest corresponding version. Semaphore uses [phpbrew](http://phpbrew.github.io/phpbrew/) for managing PHP versions.

Setting a PHP version is performed by the equivalent of the following command:

    phpbrew switch 5.5.12
