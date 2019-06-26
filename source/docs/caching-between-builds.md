---
layout: post
title: Caching between builds
category: The Semaphore platform
---

Installing application dependencies and building artifacts can take a significant amount of time, so
Semaphore caches them to make your build time shorter.

Semaphore caches certain directories automatically, and some only if the
the relevant language is selected in Project Settings.

- [Automatically cached directories](#automatic-caching)
- [Caching system packages (apt-get)](#caching-apt-get)
- [Docker layer caching](#docker-layer-caching)
- [Caching additional directories](#additional-dir-caching)

Package manager specific sections, including examples for caching dependencies
for nested projects:

- [Bundler](#bundler)
- [NPM](#npm)
- [Yarn](#yarn)
- [Composer](#composer)
- [Hex](#hex)
- [Gradle](#gradle)
- [Maven](#maven)
- [sbt](#sbt)
- [Apache Ivy](#ivy)

In all cases, only top-level directories are cached, residing in [`$SEMAPHORE_PROJECT_DIR`](/docs/available-environment-variables.html).

__Note:__
In order to expire cache for your projects, please go to Project Settings ->
Admin [Expire Dependency Cache] and click on Expire Cache.


## <a name="automatic-caching" href="#automatic-caching">Automatically cached directories</a>

The following directories are always cached, regardless of the language selected
for the project.

```bash
.semaphore-cache
.bundle
vendor/bundle
node_modules
```

The generic `.semaphore-cache` directory is located in `/home/runner/your-app/.semaphore-cache`.
The full path is available in the `$SEMAPHORE_CACHE_DIR` environment variable. In
case you need to download a lot of dependencies, it's a good idea to keep them
in this cache directory.

## <a name="additional-dir-caching" href="#additional-dir-caching">Caching additional directories</a>

Often, it's beneficial to cache generic directories as well, besides the
project dependencies. For this, utilizing symlinks is a good approach.

In the following example, the `_build` and `deps` directories are cached for `mix`, a
popular [Elixir](/docs/elixir-continuous-integration.html) build tool.

```bash
mkdir -p $SEMAPHORE_CACHE_DIR/{_build,deps}
ln -s $SEMAPHORE_CACHE_DIR/deps $SEMAPHORE_PROJECT_DIR/deps
ln -s $SEMAPHORE_CACHE_DIR/_build $SEMAPHORE_PROJECT_DIR/_build
```

Now when `mix compile` populates `deps` and `_build` in the project directory
(`$SEMAPHORE_PROJECT_DIR`), the artifacts go directly to Semaphore's cache directory.


## <a name="caching-apt-get" href="#caching-apt-get">Caching system packages (apt-get)</a>

System package installations can be cached using the built in `install-package`
utility. It is a wrapper around 'apt-get' with additional options, to minimize
runtime. See [this page](/docs/how-to-install-dependency.html#caching-installations) for more details.


## <a name="docker-layer-caching" href="#docker-layer-caching">Docker layer caching</a>

Docker images can be cached by using Docker's built-in `--cache-from`
functionality, which is described in more detail on [this
page](/docs/docker/docker-layer-caching.html).



## <a name="bundler" href="#bundler">Bundler</a>

Bundler is popular outside of Ruby projects as well, and this is the reason its
directories are cached automatically, regardless of the selected project
language.

Semaphore assumes that the gems are installed to the default `.bundle`, or to
`vendor/bundle` with `bundle install --path vendor/bundle`.

As only the top-level `.bundle` and `vendor/bundle` directories are cached automatically,
nested projects should install their dependencies with the following command, to utilize
caching:

```
cd nested-project; bundle install --path $SEMAPHORE_CACHE_DIR/bundle; cd -
```


## <a name="npm" href="#npm">NPM</a>

The usage of Node packages is common in other languages other than JavaScript as
well, and `node_modules` is cached automatically.

As only the top-level `node_modules` directory is cached automatically, nested
projects should install their dependencies with the following command, to utilize
caching:

```bash
mkdir -p $SEMAPHORE_CACHE_DIR/node_modules; rm -rf $SEMAPHORE_PROJECT_DIR/nested-project/node_modules
ln -fs $SEMAPHORE_CACHE_DIR/node_modules $SEMAPHORE_PROJECT_DIR/nested-project/node_modules
cd nested-project; npm install; cd -
```

NPM doesn't support changing the local installation path, so setting a path with
[`--cache`](https://docs.npmjs.com/misc/config#cache) will not work. A workaround like above is needed.

### Caching Cypress binary

The recommended approach to Cypress caching is to create a symbolic link to
`$SEMAPHORE_CACHE` folder. The Cypress download will be performed only if the
Cypress binary could not be found in the cache. Using the commands below in
setup of your project would use Cypress binary from cache:

```bash
# Setup caching
mkdir -p $SEMAPHORE_CACHE_DIR/Cypress
sudo ln -s $SEMAPHORE_CACHE_DIR/Cypress ~/.cache/Cypress

# Install cypress
npm install cypress --save-dev
```


## <a name="yarn" href="#yarn">Yarn</a>

Yarn dependencies are cached only when JavaScript is selected in Project Settings.

As only the top-level `node_modules` directory is cached automatically, nested
projects should install their dependencies with the following command, to utilize
caching:

```bash
cd nested-project; yarn install --modules-folder $SEMAPHORE_CACHE_DIR/nested-project-modules; cd -
```


## <a name="composer" href="#composer">Composer</a>

Composer dependencies are cached only if PHP is selected in Project Settings.
Semaphore assumes that the Composer cache is in `vendor` or in `~/.composer`.


As only the top-level `vendor` directory is cached automatically, nested
projects should install their dependencies with the following command, to utilize
caching:

```bash
cd nested-project; COMPOSER_CACHE_DIR=$SEMAPHORE_CACHE_DIR/composer-cache composer install; cd -
```

## <a name="gradle" href="#gradle">Gradle</a>

The `~/.gradle/caches` directory is cached only when
[Java](/docs/java-continuous-integration.html) is selected in Project
Settings.

## <a name="maven" href="#maven">Maven</a>

The `~/.m2` directory is cached when either [Java](/docs/java-continuous-integration.html)
or Clojure is selected in Project Settings.

## <a name="sbt" href="#sbt">sbt</a>

The `~/.sbt` directory is cached only when [Scala](/docs/scala-continuous-integration.html)
is selected in Project Settings.

## <a name="ivy" href="#ivy">Apache Ivy</a>

The `~/.ivy2` directory is cached only when [Scala](/docs/scala-continuous-integration.html)
is selected in Project Settings.

## <a name="hex" href="#hex">Hex</a>

The `~/.hex` directory is cached only when [Elixir](/docs/elixir-continuous-integration.html)
is selected in Project Settings.

If we are not caching packages of your favourite language, please [let us know](/support) how you are using them and we will expand our system.

## Caching speed

Semaphore uses cache to keep the installed application dependencies across the builds
and to make your builds faster. The cache is shared among the builds of the same project
and it is copied for each job during the system setup and at the end of the build,
the cache is saved back to the central cache repository.

However, caching is not instant, which means it takes some time to propagate changes
throughout the infrastructure. If the next build or deployment runs shortly after the
current one, the cache might not reflect the latest changes. This is why it is not
recommended to use cache for files that change often or which need to be up-to-date all
the time. If builds generate files which are needed immediately after the build, or files
that need to be accessible after the build, the best approach currently is to use some
external storage, an S3 bucket for example.
