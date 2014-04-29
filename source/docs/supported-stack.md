---
layout: post
title: Supported stack
category: The Semaphore platform
---

Every build and deploy on Semaphore runs in a lightweight, isolated virtual machine based on Ubuntu 12.04 Precise LTS 64-bit. This page describes the software provided in these VMs.

### Language support

Semaphore provides first-class support for the following programming languages:

- [Clojure](/docs/languages/clojure.html)
- [JavaScript](/docs/languages/javascript.html), via Node.js
- PHP (coming soon)
- [Ruby](/docs/languages/ruby.html)

Runtimes for the following languages are also available: C/C++, Java, Perl and Python.
For them the application has to be configured manually in [project settings](/docs/customizing-build-commands.html).
If you would like another language to be included out of the box, please [send us email](mailto:semaphore@renderedtext.com) or [install it manually](/docs/how-to-install-dependency.html).

### Database engines

Semaphore environment comes preinstalled with popular data stores. These are:

* Memcached (1.4.13)
* MongoDB (2.4.9)
* MySQL (5.6.17)
* PostgreSQL (9.3.1)
* Redis (2.8.9)
* SQLite (3.7.9)

[Read more](/docs/database-access.html) about using databases.

### Other components & services

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
      <td>28.0</td>
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
      <td>1.1.1</td>
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
      <td>3.11.0</td>
    </tr>
    <tr>
      <td>wkhtmltopdf</td>
      <td>0.9.6</td>
    </tr>
  </tbody>
</table>

__Note:__ this is a partial list. You can upgrade or add additional packages for your builds with [apt-get](/docs/how-to-install-dependency.html) - either from Ubuntu's [official distribution channels](http://packages.ubuntu.com) or third-party PPAs.

The timezone in the virtual machine is set to UTC.

We have a number of open source [test apps](/docs/test-apps.html) in various flavors that we use for verification. If your setup is different or you're having problems making your build pass, we encourage you to [contact us](mailto:semaphore@renderedtext.com) - we'd be happy to get your app building on Semaphore as quickly as possible.

### Supported test frameworks and backends

Test frameworks known to be used by our users includes:

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

Note that these are simply a reflection of the whole supported stack.
