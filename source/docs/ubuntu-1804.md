---
layout: post
title: Ubuntu 18.04 Platform
category: The Semaphore platform
---

- [Overview](#overview)
- [Why upgrade](#why-upgrade)
- [How to upgrade](#how-to-upgrade)
- [Programming languages](#programming-languages)
- [Databases](#databases)
- [Release process](#release-process)
- [Supported software stack](#supported-software-stack)
- [Changelog](#changelog)

## Overview

The Ubuntu 18.04 platform is based on [Ubuntu 18.04 LTS](https://wiki.ubuntu.com/BionicBeaver/ReleaseNotes) and optimized for CI/CD. It comes with a set of preinstalled languages, databases, and utility tools commonly used for CI/CD workflows.

The user in the environment, named `runner`, has full `sudo` access.

The Ubuntu 18.04 platform uses an APT mirror that is in the same data center as Semaphore's build cluster, which means that caching packages will have little effect.

## Why upgrade

- **Ubuntu 14.04 is deprecated** - It means that no new updates are being officially released and that most package maintainers are no longer shipping new versions. OpenSSL and other core components are outdated and installing newer versions of programming languages is either hard or impossible.
- **Ubuntu 18.04 brings new software** - New release comes with the latest software from the Linux kernel and system libraries to snapd package management.
- **New versions of programming languages** - New platform release brings the newest versions of all supported languages.
- **New versions of database** - More databases and multiple versions of databases are now available.
- **Rolling release process** - With the new version of the platform we are introducing a new non-disruptive bi-weekly platform update strategy.
- **Better resource management** - We are no longer running all databases by default which frees resources for your workloads. Also some legacy software has been removed freeing a couple more Gb of disk space.

## How to upgrade

### 1. Switch to the new version of the platform

- Visit **Project settings**.
- Click on the **Platform** tab in Project settings.
- Select **Ubuntu 18.04 - Rolling release** platform.
- Click **Save** button located at the bottom of the page.

### 2. Select programming language version with sem-version CLI

Versions are now configured with a built-in `sem-version` command. This new approach enables you to configure versions of different languages and it also enables us to add new versions faster.  

With `sem-version` you can configure versions of the following programming languages: PHP, Ruby, Erlang, Go, Java, C/C++, Python, Elixir, Scala, Node.js. For information about available versions [check documentation](#supported-software-stack).  

Example of commands that you can add to your job, or to Setup commands that will be executed as a part of every job:
```bash
sem-version ruby 2.6.3
sem-version node 10.1
```

For more information about using sem-version, [check documentation](#sem-version).

### 3. Start databases with sem-service CLI

Start only services that you need with the built-in `sem-service` command. Databases are no longer running by default so you can use the desired versions and more resources are left for running your workloads.  

With `sem-service` you can start the desired version of the following databases and services: MySQL, PostgreSQL, Redis, memcached, MongoDB, ElasticSearch and RabbitMQ.  

Example of commands that you can add to your job, or to Setup commands that will be executed before every job:

```bash
sem-service start mysql
sem-service start rabbitmq
sem-service start postgres 11.5
```

For the list of all databases, services and available versions, check the [Ubuntu 18.04 platform documentation](#supported-software-stack).

### 4. Install additional software

If your application requires software packages that are not pre-installed, be aware that versions available in Ubuntu 18.04 might differ. The best way to go about this is to check the [list of pre-installed packages](#supported-software-stack) before installing software manually.

Ubuntu 14.04 and Ubuntu 18.04 have mostly the same components with newer versions. 

Notable changes:  
- Background services are now managed with **systemd**, while in Ubuntu 14.04 it was managed by **init.d** and **upstart**.
- AppArmor is started by default. It’s likely that this will not affect your application unless you are using KVM or QEMU.

### 5. Finally: Run your jobs as you used to.

## Programming languages

The `sem-version` utility is used for changing the version of a programming language. You can find a list of all available programming languages with available versions [here](#programming-languages).  

The supported programming languages are Elixir, Erlang, Go, Java, PHP, Ruby, Python, Scala and Node.js.
The general form of the `sem-version` utility is:

```bash
sem-version [LANGUAGE] [VERSION]
```

where [LANGUAGE] is one of `elixir, erlang, go, java, php, ruby, python, scala` and `node`. The value of the [VERSION] parameter depends on the programming language used.
Example of the sem-version in your job setup:

```bash
sem-version go 1.9
```

## Databases

The `sem-service` is a utility for starting, stopping and getting the status of background services. Started services will listen on 0.0.0.0 and their default port. The 0.0.0.0 IP address includes all available network interfaces. For MySQL and Postgres it’s also possible to access them via the usual socket. Essentially, you will be using services as if they were natively installed in the Operating System.

The general form of a `sem-service` command is as follows:

```bash
sem-service start [mysql | postgres | postgis | redis | memcached | mongodb | elasticsearch | rabbitmq | rethinkdb | cassandra] [version] [--username=username] [--password=password] [--db=databasename]
```

Therefore, each `sem-service` command requires at least two parameters: the first one is the task you want to perform and the second parameter is the name of the service that will be used for the task. The third parameter is optional and is the version of the service that you want to start.

For MySQL,PostgreSQL and PostGIS it is possible to provide a username via `--username=username`, the password for the new username via `--password=password` and a database name for which the user will be granted admin access via `--db=dbname`.

- The default MySQL username is `root`, the password is `semaphoredb`.
- The default PostgreSQL and PostGIS username is `runner` and the password is `semaphoredb`.

If no version value is given, a default value will be used according to the following list:

- mysql: The default value is `5.6`
- postgres: The default value is `9.6`
- postgis: The default value is `9.6-2.5`, meaning postgis 2.5 and postgres 9.6
- redis: The default value is `4`
- memcached: The default value is `1.5`
- mongodb: The default value is `4.1`
- elasticsearch: The default value is `6.5.1`
- rabbitmq: The default is `3.8.2`
- rethinkdb: The default is `2.3.6`
- cassandra: The default is `3.11.3`

### Examples

``` bash
sem-service start mysql
sem-service start postgres
sem-service start mysql 8.0.19 --username=demo --password=asdf --db=mydb
sem-service start postgres 11 --username=demo --password=asdf --db=mydb
sem-service start postgis 12-3.0 --username=demo --password=asdf --db=mydb
sem-service start redis
sem-service start redis 5
sem-service start memcached
sem-service start elasticsearch
sem-service start elasticsearch 6.5.2
sem-service start mongodb
sem-service start mongodb 3.2
```

## Release process

- **Rolling release**: - Ubuntu 18.04 platform will be automatically updated in small increments, meaning that users will always have the latest versions of software.
- **Schedule**: The image will be updated bi-weekly, on the first and third week of every month. Updates may happen sooner if there are any security updates or bug fixes that need to be implemented. For updates please check [changelog](#changelog)
- **No action required**: Since the rolling release process is used to update this image, no action is required on user side. The newest version of software and services will be automatically available to users once the update happens.

## Supported software stack

### Version control

The following version control tools are pre-installed:

- Git (2.x)
- Git LFS (Git Large File Storage)
- Mercurial (4.5.x)
- Svn (1.9.x)

### Browsers and Headless Browser Testing

- Firefox 68.9esr
- geckodriver 0.26.0
- Google Chrome 102
- chrome_driver 102
- xvfb (X Virtual Framebuffer)
- phantomjs 2.1.1

Chrome and Firefox both support headless mode. You shouldn't need to do more than install and use the relevant Selenium library for your language. Refer to the documentation of associated libraries when configuring your project.

### Docker

Docker toolset is installed and the following versions are available:

- Docker 20.10.16
- docker-compose 1.29.2

### Cloud CLIs

- aws-cli
- eb-cli
- ecs-cli
- doctl
- gcloud
- kubectl
- heroku

### Network utilities

- httpie
- curl
- rsync

### Languages

#### Ruby

- 1.9.3-p551
- 2.0.0-p648
- 2.1.0 to 2.1.10
- 2.2.0 to 2.2.10
- 2.3.0 to 2.3.8
- 2.4.0 to 2.4.10
- 2.5.0 to 2.5.8
- 2.6.0 to 2.6.9
- 2.7.0 to 2.7.6
- 3.0.0 to 3.0.4
- 3.1.0 to 3.1.2
- jruby-9.2.11.1

#### JavaScript via Node.js

Node.js versions are managed by [nvm](https://github.com/creationix/nvm). You can install any version you need with `nvm install [version]`. 

Installed versions:

- v16.15.0 (set as default, with alias 16.15)

##### Additional tools

- Yarn: 1.22.19

#### PHP

PHP versions are managed by [phpbrew](https://github.com/phpbrew/phpbrew).

Installed versions:

- 5.6.40
- 7.0.33
- 7.1.33
- 7.2.32
- 7.3.x
- 7.4.x
- 8.0.x

The default installed PHP version is 7.4.29.

##### Additional libraries

- phpunit: 7.5.20

#### Python

Python versions are installed and managed by [virtualenv](https://virtualenv.pypa.io/en/stable/). 

Installed versions:

- 2.7
- 3.7
- 3.8
- 3.9

##### Supporting libraries

- pypy: 7.3.9
- pypy3: 7.3.9
- pip: 20.3.4
- pip3: 20.3.4
- venv: 20.14.1

#### Erlang and Elixir

Erlang versions are installed and managed via [kerl](https://github.com/kerl/kerl). Elixir versions are installed with [kiex](https://github.com/taylor/kiex).

- Erlang: 20.3, 21.3, 22.3, 23.0
- Elixir: 1.8.1, 1.8.2, 1.9.0, 1.9.1, 1.9.2, 1.9.3, 1.9.4, 1.10.1, 1.10.2, 1.10.3, 1.10.4, 1.11.1, 1.11.2, 1.11.3, 1.11.4, 1.12.3

##### Additional libraries

- rebar: 2.6.4
- rebar3: 3.18.0

#### Go

- 1.10.8
- 1.11.x
- 1.12.x
- 1.13.x
- 1.14.x
- 1.15.x
- 1.16.x
- 1.17.x
- 1.18.x

#### Java and JVM languages

- Java: 8, 11, 17
- Scala: 2.11.11, 2.12.10
- Leiningen: 2.8.1 (Clojure)
- sbt

##### Additional build tools

- Maven: 3.5.3
- Gradle: 5.2

## Changelog

### 1th June 2022

- Additions to the ubuntu1804 image:
  - Elixir versions: 1.10.4, 1.11.x 1.12
  - Go versions 1.15.x, 1.16.x, 1.17.x, 1.18.x
  - Java 17
  - Php versions: 7.4.10+, 8.0.x
  
- Updates to the ubuntu1804 image:
  - Azure-cli 2.11.1 -> 2.37.0
  - Aws-cli 1.18.142 -> 1.23.8
  - Bazel 4.2.1 -> 5.1.1
  - Chrome 94 -> 102
  - ChromeDriver 94 -> 102
  - Docker 19 -> 20.10.16
  - Docker-compose 1.26 -> 1.29.2
  - Git 2.33 -> 2.36.1
  - Git-lfs 3.0.1 -> 3.2.0
  - Helm 3.7.0 -> 3.9.0
  - Kerl 2.1.2 -> 2.4.0
  - Rebar3 3.15.2 -> 3.18.0
  - Terraform 0.15.0 -> 1.1.9



### 23th September 2020

- Additions to the ubuntu1804 image:
  - Elixir versions: 1.10.0, 1.10.2, 1.10.3
  - Go version: 1.15.2
  - Azure-cli version: 2.11.1
  
- Updates to the ubuntu1804 image:
  - Aws cli 1.18.129 -> 1.18.142
  - Chrome 84 -> 85
  - Chromedriver 84 -> 85
  - Docker-compose 1.26.2 -> 1.27.2
  - Go 1.13.14 -> 1.13.15
  - Go 1.14.6 -> 1.14.7
  - Heroku 7.42.8 -> 7.43.0
  - Php 7.2.31 -> 7.2.33
  - Php 7.3.21 -> 7.3.22
  - Php 7.4.9 -> 7.4.10
  - Yarn 1.22.4 -> 1.22.5

### 24th August 2020

- Updates to the ubuntu1804 image:

    - Aws-cli 1.18.117 -> 1.18.124
    - Elixir 1.10.4 now uses Erlang 23.0.3
    - Java 8u252 -> 8u265
    - Heroku 7.42.6 -> 7.42.8
    - Php 7.3.20 -> 7.3.21
    - Php 7.4.8 -> 7.4.9
    - Pypy 5.8.0 -> 7.3.1
    

### 12th August 2020

- Additions to the ubuntu1804 image:

    - Firefox version 78.1.0esr

- Updates to the ubuntu1804 image:

    - Aws-cli 1.18.104 -> 1.18.117
    - Java 8u252 -> 8u265
    - Heroku 7.42.5 -> 7.42.6
    - Google-cloud-sdk downgrade 300 -> 297
    

### 27th July 2020

- Additions to the ubuntu1804 image:

    - Parallel version 20161222

- Updates to the ubuntu1804 image:

    - Aws-cli 1.18.96 -> 1.18.104
    - Go 1.13.12 -> 1.13.14
    - Go 1.14.4 -> 1.14.6
    - Heroku 7.42.2 -> 7.42.5
    - OpenJDK 11.0.7 -> 11.0.8
    - PHP 7.2.31 -> 7.3.32
    - PHP 7.3.19 -> 7.3.20
    - PHP 7.4.7 -> 7.4.8


### 13th July 2020

- Updates to the ubuntu1804 image:

    - Aws-cli 1.18.90 -> 1.18.96
    - Elixir 1.8.1 -> 1.8.2
    - Elixir 1.9.3 -> 1.9.4
    - Elixir 1.10.3 -> 1.10.4
    - Heroku 7.42.1 -> 7.42.2
    - PHP 7.3.18 -> 7.3.19
    - PHP 7.4.6 -> 7.4.7


### 30th June 2020

- Additions to the ubuntu1804 image
    - Sysstat

- Updates to the ubuntu1804 image:
    - Aws-cli 1.18.77 -> 1.18.90
    - Docker-compose 1.24.1 -> 1.26.0

### 15th June 2020

- Updates to the ubuntu1804 image:
    - Aws-cli 1.18.68 -> 1.18.77
    - Firefox 68.4esr -> 68.9esr
    - Git 2.26 -> 2.27
    - Go 1.13.10 -> 1.13.12
    - Go 1.14.2 -> 1.14.4
    - Heroku 7.41.1 -> 7.42.1
    
### 1st June 2020

- Additions to the ubuntu1804 image
    - Erlang 23.0

- Updates to the ubuntu1804 image:
    - Aws-cli 1.18.59 -> 1.18.68
    - Chromedriver 81 -> 83
    - Google Chrome 81 -> 83
    - Php 7.2.29 -> 7.2.31
    - Php 7.3.16 -> 7.3.18
    - Php 7.4.4 -> 7.4.6

### 18th May 2020

- Additions :
    - Doctl 1.43.0

- Updates :
    - Aws-cli 1.18.42 -> 1.18.59
    - Git-lfs 2.10.0 -> 2.11.0
    - Go 1.13.9 -> 1.13.10
    - Go 1.14.1 -> 1.14.2
    - Heroku 7.39.3 -> 7.41.1
    - Php 7.2.28 -> 7.2.29
    - Php 7.3.15 -> 7.3.16
    - Php 7.4.3 -> 7.4.4
    - Sbt 0.13.17 -> 1.3.10


### 27th April 2020

- Additions:
  - Elixir 1.10.1, 1.10.2
  - Go 1.14.1
- Updates:
  - Aws-cli 1.18.39 -> 1.18.42
  - Heroku 7.39.2 -> 7.39.3
  - Jruby 9.1.17.0 -> 9.2.11.1

### 13th April 2020

- Additions:
  - Wkhtmltox 0.15
  - Ruby 2.4.10, 2.5.8, 2.6.6, 2.7.1
- Updates  
  - Aws-cli 1.18.20 -> 1.18.39
  - Git  2.25 -> 2.26
  - Erlang 22.1 -> 22.3
  - Go 1.12.10 -> 1.12.17
  - Go 1.13.1  -> 1.13.8
  - Heroku 7.39.0 -> 7.39.2
  - Google Chrome 80 -> 81
  - Chromedriver 80 -> 81
  
### 25th March 2020

Initial release.


