---
layout: post
title: Supported application stack
category: The Semaphore platform
---

Semaphore supports Ruby applications and provides UI for configuring version of Ruby. It also generates `database.yml` for your Ruby application based on selected database engine.

Apart from Ruby the following languages are also available: JavaScript (Node.js), Java, Python, C/C++ and Perl. For those languages application has to be configured manually in your project's [custom build commands](/docs/custom-build-commands.html). If you would like another language to be included out of the box, [send us email](mailto:semaphore@renderedtext.com) or [install it manually](/docs/how-to-install-dependency.html).

Below you can find information about installed software.

### Ruby versions

* 2.1.0
* 2.0.0-p353
* 1.9.3-p484
* 1.9.2-p320
* ree-1.8.7-2012.02
* JRuby 1.7.9
* Bundler 1.3.5
* RubyGems 2.1.11

Ruby versions are available via [rbenv](https://github.com/sstephenson/rbenv/). If you need to install an additional version, please check [this guide](/docs/how-to-install-specific-ruby-version.html).

### Database engines

* PostgreSQL (9.3.1)
* MySQL (5.5.34)
* SQLite (3.7.9)
* Redis (2.8.1)
* MongoDB (2.4.8)
* Memcached (1.4.13)

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

### Other languages & platforms

* Node.js (0.10.22)
* Java (openjdk7 - 7u25-2.3.10)
* Python (2.7.3)
* C/C++ (gcc 4.6)
* Perl (5.14.2)

Builds on Semaphore run on Ubuntu 12.04 Precise LTS.

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
      <td>26.0</td>
    </tr>
    <tr>
      <td>Chrome</td>
      <td>31.0.1650</td>
    </tr>
    <tr>
      <td>chromedriver</td>
      <td>2.4</td>
    </tr>
    <tr>
      <td>Elasticsearch</td>
      <td>0.90.9</td>
    </tr>
    <tr>
      <td>Sphinx</td>
      <td>2.0.4</td>
    </tr>
    <tr>
      <td>PhantomJS</td>
      <td>1.9.2</td>
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

__Note:__ this is a partial list. You can upgrade or add additional packages for your builds with [apt-get](how-to-install-dependency) - either from Ubuntu's [official distribution channels](http://packages.ubuntu.com) or third-party PPAs.
