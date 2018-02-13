---
layout: post
title: Custom database.yml
category: Ruby
---

If you select PostgreSQL or MySQL as database for a project, Semaphore will
generate `database.yml` file for the project, with working credentials. In
some cases you might want to use your own `database.yml`. This includes
projects that depend on more than one database.

You can create a custom `database.yml` using [configuration
files](/docs/adding-configuration-files.html) and [environment
variables](/docs/available-environment-variables.html).

An example configuration file at `project_name/config/database.yml` path
might look like this:

```yml
development:
  adapter: postgresql
  database: <%= ENV['DATABASE_NAME_DEVELOPMENT'] %>
  encoding: utf8
  username: <%= ENV['DATABASE_USERNAME'] %>
  password: <%= ENV['DATABASE_PASSWORD'] %>

test: &test
  adapter: postgresql
  database: <%= ENV['DATABASE_NAME_TEST'] %>
  encoding: utf8
  username: <%= ENV['DATABASE_USERNAME'] %>
  password: <%= ENV['DATABASE_PASSWORD'] %>

api_test: &api_test
  adapter: postgresql
  database: api_<%= ENV['DATABASE_NAME_TEST'] %>
  encoding: utf8
  username: <%= ENV['DATABASE_USERNAME'] %>
  password: <%= ENV['DATABASE_PASSWORD'] %>
```

Note that Semaphore won't create databases automatically. You need to add build
commands to create the database.
