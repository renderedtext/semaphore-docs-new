---
layout: post
title: Platform changelog
category: The Semaphore platform
---

Current package versions are listed on the [Supported application stack](/docs/supported-stack.html) page.

### v1409 - 2014-09-22(planned)

```
- additions:
  - php 5.6.0
- upgrades:
  - bundler 1.6.3 -> 1.7.2
  - elasticsearch 1.2.1 -> 1.3.2
  - firefox 30 -> 32
  - git 2.0.1 -> 2.1
  - jruby 1.7.13 -> 1.7.15
  - nodejs 0.8.27 -> 0.8.28
  - nodejs 0.10.29 -> 0.10.31
  - php 5.4.30 -> 5.4.32
  - php 5.5.14 -> 5.5.16
  - ruby 1.9.2p320 -> 1.9.2p330
  - ruby 1.9.3p545 -> 1.9.3p547

```
### v1407 - 2014-07-07

```
- additions:
  - aws cli
- upgrades:
  - firefox 29 -> 30
  - elasticsearch 1.1.1 -> 1.2.1
  - bundler 1.6.2 -> 1.6.3
  - jruby 1.7.12 -> 1.7.13
  - php 5.4.28 -> 5.4.30
  - php 5.5.12 -> 5.5.14
  - nodejs 0.8.26 -> 0.8.27
  - nodejs 0.10.28 -> 0.10.29
```

### v1405.2 - 2014-05-28

```
- additions:
  - php 5.3.28
  - php 5.4.28
  - php 5.5.12
  - phpbrew 1.13.1
- upgrades:
  - nodejs 0.11.10 -> 0.11.13
```

### v1405.1 2014-05-15

```
- additions:
  - ruby 2.1.2
- upgrades:
  - ruby 2.0.0-p451 -> 2.0.0-p481
```

### v1405 - 2014-05-05

```
- upgrades:
  - bundler 1.5.3 -> 1.6.2
  - elasticsearch 1.0.1 -> 1.1.1
  - firefox 27 -> 29
  - jruby 1.7.11 -> 1.7.12
  - mysql 5.5 -> 5.6
  - redis 2.8.6 -> 2.8.9
- other:
  - timezone changed from UTC+1 to UTC
```

### 2014-03-05

```
- additions:
  - ruby 2.1.1
- upgrades:
  - bundler 1.5.3
  - chromedriver 2.9
  - elasticsearch 1.0.1
  - firefox 27
  - google-chrome-stable 33
  - grunt 0.1.13
  - mongodb 2.4.9
  - node.js 0.10.26, 0.11.11
  - npm 1.4.3
  - phantomjs 1.9.7
  - ruby 1.9.3-p545, 2.0.0-p451
  - rubygems 2.2.2
```

### 2014-01-30

```
- upgrades:
  - chromedriver 2.8
```

### 2014-01-24

```
- nodejs now set up via nvm
- nodejs versions available:
  - 0.8.26
  - 0.10.24
  - 0.11.10
  - npm version is 1.3.21
- other upgrades:
  - chrome 32
```

### 2013-12-30

```
- grunt-cli (0.1.11) and bower (1.2.8) available globally for node.js projects
- elasticsearch default configuration changed to avoid possible race conditions:
  - index.number_of_shards: 1
  - index.number_of_replicas: 0
- screen resolution (via xvfb) increased from 1024x768 to 1900x1200
- added leiningen (2.3.4) for building clojure projects
- upgrades:
  - ruby 2.1.0 final
  - jruby 1.7.9
  - nodejs 0.10.24
  - elasticsearch 0.90.9
  - firefox 26
  - redis 2.8.3
```

### 2013-11-29

```
- upgrades:
  - ruby 2.1.0-preview2
  - ruby 2.0.0-p353
  - ruby 1.9.3-p484
  - jruby 1.7.8
  - rubygems 2.1.11
  - chrome 31.0
  - elasticsearch 0.90.7
  - mongodb 2.4.8
  - nodejs 0.10.22
  - phantomjs 1.9.2
  - redis 2.8.1
```

### 2013-11-02

```
- Ruby 2.1.0-preview1 available via rbenv
- default locale is en_US.UTF-8, instead of C.UTF-8
- upgrades:
  - firefox  25.0
  - mongodb  2.4.7
  - postgres 9.3.1
```

### 2013-10-18

```
- upgrades:
  - all ruby version include the latest rubygems (currently 2.1.9)
  - jruby 1.7.5
```

### 2013-10-02

```
- upgrades:
  - git           1.8.4
  - redis         2.6.16
  - mysql         5.5.32
  - java          7u25-2.3.10
  - nodejs        0.10.20
  - elasticsearch 0.90.5
  - firefox       24.0
  - chrome        30.0
  - chromedriver  2.4
```

### 2013-07-07

```
- ruby 1.9.3 is the default for new projects
- removed ruby 1.9.3-p327
- added heroku client 2.39.4
- upgrades:
  - ruby          2.0.0-p247
  - ruby          1.9.3-p448
  - jruby         1.7.4
  - bundler       1.3.5
  - nodejs        0.10.12
  - phantomjs     1.9.1
  - elasticsearch 0.90.2
  - firefox       22.0
  - chrome        28.0
```
