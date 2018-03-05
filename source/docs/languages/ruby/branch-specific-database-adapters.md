---
layout: post
title: Branch specific database adapters
category: Ruby
tags:
  - ruby
---

Let's say you are migrating your project from MySQL to PostgreSQL. You want one
or more branches to use PostgreSQL, but you have chosen MySQL in your build settings on Semaphore.

One way of doing that on Semaphore is to [use a custom database.yml](/docs/languages/ruby/custom-database-yml.html)
and conditionally set an environment variable in your build commands to differentiate between adapters.

In the build command, depending on the branch name, export the environment variable like shown below.

```bash
if [ "$BRANCH_NAME" = "pg-branch"  ]; then export DB_ADAPTER=postgresql; else export DB_ADAPTER=mysql ; fi
```

Optionally, you can use one or more `elif` statements to detect more branches if needed.
In the `database.yml` file, the adapter should be configured as follows:

```yml
...
adapter: <%= ENV["DB_ADAPTER"]%>
...
```
