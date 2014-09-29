---
layout: post
title: Branch specific database adapters
category: Ruby
---

A prerequisite to selecting a database adapter for a branch is to [use a custom database.yml](/docs/languages/ruby/custom-database-yml.html)
file which uses an environment variable to define the adapter.

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
