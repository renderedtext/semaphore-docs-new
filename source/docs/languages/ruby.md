---
layout: post
title: Ruby
category: Languages
---

Semaphore has the following Ruby versions available via [rbenv](https://github.com/sstephenson/rbenv/):

- 2.1.2
- 2.1.1
- 2.1.0
- 2.0.0-p481
- 1.9.3-p545
- 1.9.2-p320
- ree-1.8.7-2012.02
- JRuby 1.7.12

The Semaphore stack includes:

- Bundler 1.6.2
- RubyGems 2.2.2

List of all packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.

The version specified in project settings will be set as global before your build commands run. Semaphore uses [rbenv](https://github.com/sstephenson/rbenv) for managing Ruby versions. 

Setting Ruby version is performed by the equivalent of the following commands:

    rm -f .rbenv-version .ruby-version
    rbenv global 2.0.0-p451

### Installing additional version of Ruby

In case your application requires specific Ruby version which is not available by default in Semaphore VM you can install it via rbenv. It's simple. You would only need to add few lines to your [build commands](/docs/customizing-build-commands.html) like in example below:

```bash
rbenv install 2.1.0-preview1
rbenv local 2.1.0-preview1
gem install bundler --no-ri --no-rdoc
# followed by your build commands
```

### Switching Ruby version on a specific branch

Add a new [build command](/docs/customizing-build-commands.html) that will set the Ruby version:

```bash
if [ "$BRANCH_NAME" = "ruby-2" ]; then rbenv local 2.0.0-p247 ; fi
```

Current package versions are listed on the [Supported application stack](/docs/supported-stack.html) page.

### Using database from a Ruby application

In case a database engine in selected in project settings, Semaphore will generate a file `config/database.yml` with working [database access](/docs/database-access.html) credentials.
