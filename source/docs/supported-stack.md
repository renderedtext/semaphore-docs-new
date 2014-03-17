---
layout: post
title: Supported stack
category: The Semaphore platform
---

Semaphore officially supports Ruby, JavaScript and Clojure projects and provides UI for configuring versions for them.

In case of Ruby, it also generates a working `database.yml` or equivalent, based on selected database engine.

The following languages are also available: C/C++, Java, Perl and Python.
For them the application has to be configured manually in [project settings](/docs/customizing-build-commands.html).
If you would like another language to be included out of the box, please [send us email](mailto:semaphore@renderedtext.com) or [install it manually](/docs/how-to-install-dependency.html).

Below you can find information about installed software.

### Ruby versions

* 2.1.1
* 2.1.0
* 2.0.0-p451
* 1.9.3-p545
* 1.9.2-p320
* ree-1.8.7-2012.02
* JRuby 1.7.11
* Bundler 1.5.3
* RubyGems 2.2.2

Ruby versions are available via [rbenv](https://github.com/sstephenson/rbenv/). If you need to install an additional version, please check [this guide](/docs/installing-additional-version-of-ruby.html).

### Node.js versions

* 0.8.26
* 0.10.26
* 0.11.11
* NPM 1.4.3
* Grunt 0.1.13
* Bower 1.2.8

Node.js versions are available via [NVM](https://github.com/creationix/nvm).

### Clojure support

* Leiningen 2 (2.3.4)
* Java (openjdk7 - 7u25-2.3.10)

### Database engines

* PostgreSQL (9.3.1)
* MySQL (5.5.34)
* SQLite (3.7.9)
* Redis (2.8.6)
* MongoDB (2.4.9)
* Memcached (1.4.13)

[Read more](/docs/database-access.html) about using databases.

### Test frameworks and backends

* test/unit
* RSpec
* Cucumber
* Steak
* Capybara with Selenium
* Capybara Webkit
* Poltergeist and PhantomJS
* Jasmine
* Minitest
* Karma

This is a partial list of frameworks known to be used by our users. They are simply a reflection of the supported stack.

### Other languages & platforms

* C/C++ (gcc 4.6)
* Java (openjdk7 - 7u25-2.3.10)
* Perl (5.14.2)
* Python (2.7.3)

Builds on Semaphore run on Ubuntu 12.04 Precise LTS 64-bit.

The timezone on the machine is UTC.

We have a number of open source [test apps](/docs/test-apps.html) in various flavors that we use for verification. If your setup is different or you're having problems making your build pass, we encourage you to [contact us](mailto:semaphore@renderedtext.com) - we'd be happy to get your app building on Semaphore as quickly as possible.

Other important system packages installed by default include:

<table class="table table-striped">
  <thead>
    <tr>
      <th>Name</th>
      <th>Version</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Firefox</td>
      <td>27.0</td>
    </tr>
    <tr>
      <td>Chrome</td>
      <td>33.0.1750</td>
    </tr>
    <tr>
      <td>chromedriver</td>
      <td>2.9</td>
    </tr>
    <tr>
      <td>Elasticsearch</td>
      <td>1.0.1</td>
    </tr>
    <tr>
      <td>Sphinx</td>
      <td>2.0.4</td>
    </tr>
    <tr>
      <td>PhantomJS</td>
      <td>1.9.7</td>
    </tr>
    <tr>
      <td>libqtwebkit4</td>
      <td>2.2.1</td>
    </tr>
    <tr>
      <td>imagemagick</td>
      <td>6.6.9.7</td>
    </tr>
    <tr>
      <td>Linux kernel</td>
      <td>3.2.0</td>
    </tr>
    <tr>
      <td>wkhtmltopdf</td>
      <td>0.9.6</td>
    </tr>
  </tbody>
</table>

__Note:__ this is a partial list. You can upgrade or add additional packages for your builds with [apt-get](/docs/how-to-install-dependency.html) - either from Ubuntu's [official distribution channels](http://packages.ubuntu.com) or third-party PPAs.
