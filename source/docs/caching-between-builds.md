---
layout: post
title: Caching between builds
category: The Semaphore platform
---

Installing application dependencies can take a significant amount of time, so
Semaphore caches them to make your build time shorter.

Semaphore caches certain directories automatically, and some only if the
the relevant language is selected in Project Settings.

- [Automatically cached directories](#automatic-caching)
- [Caching additional directories](#additional-dir-caching)
- [Docker layer caching](#docker-layer-caching)

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


## <a name="automatic-caching" href="#automatic-caching">Automatically cached directories</a>

The following directories are always cached, regardless of the language selected
for the project.

```bash
.semaphore-cache
.bundle
vendor/bundle
node_modules
```

The generic cache directory `.semaphore-cache` is located in `/home/runner/your-app/.semaphore-cache`.
The full path is available in `SEMAPHORE_CACHE_DIR` environment variable. In
case you need to download a lot of dependencies, it's a good idea to keep them
in this cache directory.


## <a name="additional-dir-caching" href="#additional-dir-caching">Caching additional directories</a>

Often, it's beneficial to cache generic directories as well, besides the
project dependencies. For this, utilizing symlinks is a good approach.

In the following example, the `_build` and `deps` directories are cached for `mix`, a
popular Elixir build tool.

```bash
mkdir -p $SEMAPHORE_CACHE_DIR/{_build,deps}
ln -s $SEMAPHORE_CACHE_DIR/deps $SEMAPHORE_PROJECT_DIR/deps
ln -s $SEMAPHORE_CACHE_DIR/_build $SEMAPHORE_PROJECT_DIR/_build
```

Now when `mix compile` populates `deps` and `_build` in the project directory
(`$SEMAPHORE_PROJECT_DIR`), the artifacts go directly to Semaphore's cache directory.


## Docker caching

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
cd nested-project; npm --cache $SEMAPHORE_CACHE_DIR/node_modules install; cd -
```

In case of multiple nested projects, each one can have its own cache directory:

```bash
cd nested-project-1; npm --cache $SEMAPHORE_CACHE_DIR/nested-project-1-modules install; cd -
cd nested-project-2; npm --cache $SEMAPHORE_CACHE_DIR/nested-project-2-modules install; cd -
```


## <a name="yarn" href="#yarn">Yarn</a>

Yarn dependencies are cached only when JavaScript is selected in Project Settings.

As only the top-level `node_modules` directory is cached automatically, nested
projects should install their dependencies with the following command, to utilize
caching:

```bash
cd nested-project; yarn install --modules-folder $SEMAPHORE_CACHE_DIR/nested-project-1-modules; cd -
```

In case of multiple nested projects, each one can have its own cache directory:

```bash
cd nested-project-1; yarn install --modules-folder $SEMAPHORE_CACHE_DIR/nested-project-1-modules; cd -
cd nested-project-1; yarn install --modules-folder $SEMAPHORE_CACHE_DIR/nested-project-2-modules; cd -
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


If we are not caching packages of your favourite language, please [let us know](mailto:semaphore+docscachepage@renderedtext.com) how you are using them and we will expand our system.
