---
layout: post
title: PHP
category: Languages
---

Current package versions are listed on the [Supported application stack](/docs/supported-stack.html) page.

The Semaphore stack includes:

- [Composer](https://getcomposer.org/)
- [PEAR](http://pear.php.net/)
- [PECL](http://pecl.php.net/)
- [phpbrew](http://phpbrew.github.io/phpbrew/)
- [PHPunit 4.1](http://phpunit.de/)

The major version specified in project settings will be set as global to the latest corresponding version. Semaphore uses [phpbrew](http://phpbrew.github.io/phpbrew/) for managing PHP versions.

Setting a PHP version is performed by the equivalent of the following command:

    phpbrew switch 5.5.12
