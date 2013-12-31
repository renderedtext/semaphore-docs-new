---
layout: post
title: Platform changelog
category: The Semaphore platform
---

Current package versions are listed on the [Supported application stack](/supported-stack) page.

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
