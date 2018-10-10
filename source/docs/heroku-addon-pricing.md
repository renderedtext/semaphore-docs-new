---
layout: post
title: Semaphore as a Heroku add-on pricing
category: Billing
---

Besides regular accounts offered via [semaphoreci.com](https://semaphoreci.com),
Semaphore's continuous integration and continuous delivery service is also
available through [a Heroku
add-on](https://elements.heroku.com/addons/semaphore).

The Heroku add-on is applied per project on Semaphore. Heroku project is the
one which you configure after provisioning the add-on.
The add-on pricing is designed with that limitation in mind, and varies based on
number of boxes available to that project for parallel jobs.

A project created via Heroku add-on can belong to any organization account on
Semaphore, but it cannot use the box resources that otherwise belong to that
organization account — only the boxes allocated to it by according to the
Heroku add-on.

Billing of the Heroku add-on is managed by Heroku and incorporated in the
invoice of your Heroku application.

Accounts created directly on [semaphoreci.com](https://semaphoreci.com) can
accommodate an unlimited number of projects, and the billing is managed by
Semaphore. Boxes allocated by the account can be shared among all projects that
belong to that account.

### Monitoring usage of Heroku Nano (Free plan)

You can see the current status of your Heroku add-on plan and usage in project
settings > Heroku Add-on tab.
