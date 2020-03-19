---
layout: post
title: Ubuntu 1804 - Bionic
category: The Semaphore platform
---
## <a name="intro" href="#intro">Intro</a>

## <a name="why-migrate" href="#why-migrate">Why migrate to this platform version</a>
- Ubuntu 14.04 is deprecated and cannot be updated any more
  - Ubuntu 14.04 uses an old version of OpenSSL which means you won’t be able to build new versions of languages like php.
- Ubuntu 18.04 brings newer versions of every programming language available on the previous platform.
- It is updated in a non-disruptive, rolling release process every two weeks.
- More free space in the image (Ubuntu 14.04 - 7.9GB, Ubuntu 18.04 - ?X)
- 18.04 comes with a lot of other benefits (new drivers, broader file systems support, tools like snapd).
To start the upgrade process read our [Migrating from Ubuntu 14.04 (Trusty)](URL) guide.

## <a name="release-process" href="#release-process">How and when is it updated</a>
The image will be updated bi-weekly, on the first and third Monday of every month. Updates can be followed on [Semaphore Changelog](http://semaphoreci.com/docs/platform-changelog.html). 

Updates may happen sooner if there are any security updates or bug fixes that need to be implemented.

## <a name="how-to-configure" href="#how-to-configure">How can you configure your project to use it</a>
- Go into Project > platform settings

For more information on differences in setting up Ubuntu 14.04 project and Ubuntu 18.04 project please visit our [migration guide](URL).

## <a name="languages" href="#languages">Programming languages & versions</a>
### <a name="sem-version" href="#sem-version">sem-version: Managing Language Versions on Linux</a>
The `sem-version` utility in Linux based virtual machines is used for changing the version of a programming language.
The supported programming languages are `elixir, erlang, go, java, php, ruby, python, scala` and `node`.
The general form of the `sem-version` utility is:

```sem-version [PROGRAMMING LANGUAGE] [VERSION]```

where [PROGRAMMING LANGUAGE] is one of `elixir, erlang, go, java, php, ruby, python, scala` and `node`. The value of the [VERSION] parameter depends on the programming language used.
Example of sem-version in your job set up:

`sem-version go 1.9`

## <a name="databases" href="#databases">Databases & services</a>
### <a name="sem-service" href="#sem-service">sem-service: Managing Databases and Services on Linux</a>
The `sem-service` is a utility on Linux based virtual machines for starting, stopping and getting the status of background services. Started services will listen on 0.0.0.0 and their default port. The 0.0.0.0 IP address includes all available network interfaces. Essentially, you will be using services as if they were natively installed in the Operating System.

The general form of a `sem-service` command is as follows:

```
sem-service start [mysql | postgres | redis | memcached | mongodb | elasticsearch | rabbitmq] [version] [--username=username] [--password=password] [--db=databasename]
```

Therefore, each `sem-service` command requires at least two parameters: the first one is the task you want to perform and the second parameter is the name of the service that will be used for the task. The third parameter is optional and is the version of the service that you want to start.

For MySQL and PostgreSQL it is possible to provide username via `--username=username`, password for the new username via `--password=password` and database name for which the user will be granted admin access via `--db=dbname`.

- The default MySQL username is root, the password is blank and the default database name is test
- The default PostgreSQL username is postgres and password is blank.

If no version value is given, a default value will be used according to the following list:

- mysql: The default value is `5.6`
- postgres: The default value is `10.6`
- redis: The default value is `4`
- memcached: The default value is `1.5`
- mongodb: The default value is `4.1`
- elasticsearch: The default value is `6.5.1`
- rabbitmq: The default is `3.8.2`

`sem-service` pulls images from Docker Hub and supports all versions that are available in Docker Hub. You can find the list of available versions at the following URLs:

- ElasticSearch: <https://hub.docker.com/_/elasticsearch/>
- MySQL: <https://hub.docker.com/_/mysql/>
- PostgreSQL: <https://hub.docker.com/_/postgres/>
- Redis: <https://hub.docker.com/_/redis/>
- MongoDB: <https://hub.docker.com/_/mongo/>
- Memcached: <https://hub.docker.com/_/memcached/>
- RabbitMQ: <https://hub.docker.com/_/rabbitmq/>

The following are valid uses of `sem-service`:

``` bash
sem-service start redis
sem-service stop redis
sem-service start redis 5
sem-service status postgres
sem-service start postgres 11
sem-service start postgres 11 --username=some_user_name --password=some_password --db=some_db_name
sem-service start mysql 8.0.19 --username=some_user_name --password=some_password --db=some_db_name
sem-service status mysql
sem-service start memcached
sem-service start elasticsearch
sem-service start elasticsearch 6.5.2
sem-service start mongodb
sem-service start mongodb 3.2
```
## <a name="migration-guide" href="#migration-guide">Migrating from Ubuntu 14.04 (Trusty)</a>
You can find a couple of useful tips for migrating from Ubuntu 14.04 to Ubuntu 18.04 in our [migration guide](URL).

## <a name="supported-stack" href="#supported-stack">What is preinstalled</a>
### <a name="ubuntu-1804-image" href="#ubuntu-1804-image">Ubuntu 18.04 Image</a>
The `ubuntu1804` is a customized image based on [Ubuntu 18.04 LTS](https://wiki.ubuntu.com/BionicBeaver/ReleaseNotes) optimized for CI/CD. It comes with a set of preinstalled languages, databases, and utility tools commonly used for CI/CD workflows.

The `ubuntu1804` is a virtual machine (VM) image. The user in the environment, named `runner`, has full `sudo` access.

The `ubuntu1804` VM uses an APT *mirror* that is in the same data center as Semaphore's build cluster, which means that caching packages will have little effect.

#### <a name="version-control" href="#version-control">Version control</a>
Following version control tools are pre-installed:

- Git (2.x)
- Git LFS (Git Large File Storage)
- Mercurial (4.5.x)
- Svn (1.9.x)

#### <a name="browsers" href="#browsers">Browsers and Headless Browser Testing</a>
- Firefox 68.4.1
- geckodriver 0.26.0
- Google Chrome 80
- chrome_driver 80
- xvfb (X Virtual Framebuffer)
- phantomjs 2.1.1

Chrome and Firefox both support headless mode. You shouldn't need to do more than install and use the relevant Selenium library for your language. Refer to the documentation of associated libraries when configuring your project.
#### <a name="docker" href="#browsers">Docker</a>
Docker toolset is installed and following versions are available:

- Docker 19.03
- docker-compose 1.24.1
#### <a name="cloud-cli" href="#cloud-cli">Cloud CLIs</a>
- aws-cli
- eb-cli
- ecs-cli
- gcloud
- kubectl
- heroku

#### <a name="network" href="#network">Network utilities</a>
- httpie
- curl
- rsync

### <a name="supported-languages" href="#supported-languages">Languages</a>
#### <a name="erlang-and-elixir" href="#erlang-and-elixir">Erlang and Elixir</a>
Erlang versions are installed and managed via [kerl](https://github.com/kerl/kerl). Elixir versions are installed with [kiex](https://github.com/taylor/kiex).

- Erlang: 20.3, 21.3, 22.2
- Elixir: 1.7.4, 1.8.0, 1.8.1, 1.8.2, 1.9.0, 1.9.1, 1.9.2, 1.9.3, 1.9.4

**Additional libraries:**

- rebar: 2.6.4
- rebar3: 3.12.1

#### <a name="go" href="#go">Go</a>

- 1.10.8
- 1.11.13
- 1.12.10
- 1.13.1

#### <a name="java" href="#java">Java and JVM languages</a>

- Java: 8, 11
- Scala: 2.11.11, 2.12.10
- Leiningen: 2.9.1 (Clojure)
- sbt
.**Additional build tools**

- Maven: 3.5.4
- Gradle: 5.2

#### <a name="javascript" href="#javascript">JavaScript via Node.js</a>
Node.js versions are managed by [nvm](https://github.com/creationix/nvm). You can install any version you need with `nvm install [version]`. 

Installed versions:

- v8.17.0 (set as default, with alias 8.17)
- v10.19.0
- v12.16.0

**Additional tools**

- Yarn: 1.22.4
- Bower: 1.8.8

#### <a name="php" href="#php">PHP</a>

PHP versions are managed by [phpbrew](https://github.com/phpbrew/phpbrew).

Installed versions:

- 5.6.40
- 7.0.33
- 7.1.33
- 7.2.28
- 7.3.15
- 7.4.3

The default installed PHP version is 17.2.281.

**Additional libraries**

- phpunit: 7.5.20

#### <a name="python" href="#python">Python</a>
Python versions are installed and managed by [virtualenv](https://virtualenv.pypa.io/en/stable/). 

Installed versions:

- 2.7
- 3.6
- 3.7
- 3.8

**Supporting libraries:**

- pypy: 5.8.0
- pypy3: 5.8.0
- pip: 20.0.2
- pip3: 19
- venv: 16.0.0

#### <a name="ruby" href="#ruby">Ruby</a>

- 1.9.3-p551
- 2.0.0-p648
- 2.1.0 to 2.1.10
- 2.2.0 to 2.2.10
- 2.3.0 to 2.3.8
- 2.4.0 to 2.4.9
- 2.5.0 to 2.5.7
- 2.6.0 to 2.6.5
- 2.7.0
- jruby-9.1.17.0
