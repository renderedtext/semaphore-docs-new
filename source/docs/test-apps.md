---
layout: post
title: Test applications
category: Managing dependencies
---

To make sure that Semaphore works with various database drivers, test frameworks etc, we've created a number of simple open source test apps. We then build these apps on Semaphore to verify that it works.

## Covered

* [base-app](https://github.com/renderedtext/base-app) - our template for making new Rails apps, using Postgresql, RSpec and Cucumber.
* [testapp-capybara-webkit](https://github.com/renderedtext/testapp-capybara-webkit) - including a branch with steak and wkhtmltopdf.
* [testapp-mongodb-mongoid](https://github.com/renderedtext/testapp-mongodb)
* [testapp-mongodb-mongomapper](https://github.com/renderedtext/testapp-mongodb-mongomapper)
* [testapp-mysql](https://github.com/renderedtext/testapp-mysql) - using mysql2 gem.
* [testapp-solr](https://github.com/renderedtext/testapp-solr)
* [testapp-sphinx](https://github.com/renderedtext/testapp-sphinx)
* [testapp-testunit](https://github.com/renderedtext/testapp-testunit)
* [testapp-testunit-rspec](https://github.com/renderedtext/testapp-testunit-rspec) - using test/unit, RSpec and Cucumber at the same time.

## Contributing

While we do our best to solve any problem our users have on our own, we also welcome being told what's inside your app that we do not support, so that we can get to it faster. We'd also be delighted to see our users make their testapp flavors. Either way, shoot us an email at <mailto:semaphore@renderedtext.com>.
