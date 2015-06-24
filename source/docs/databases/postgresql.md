---
layout: post
title: PostgreSQL
category: Databases
---

PostgreSQL is running on the default port of 5432.

Credentials for using PostgreSQL are available in environment variables listed below:

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>DATABASE_POSTGRESQL_USERNAME</td>
      <td>runner</td>
    </tr>
    <tr>
      <td>DATABASE_POSTGRESQL_PASSWORD</td>
      <td>semaphoredb</td>
    </tr>
  </tbody>
</table>

If your application doesn't create it's own database as part of the start-up 
process, you can create a PostgreSQL database manually. Adding the following
command to your [build
commands](/docs/customizing-build-commands.html) will 
create a PostgreSQL database:

```bash
createdb test_db -U $DATABASE_POSTGRESQL_USERNAME
```

Note that the `createdb` command doesn't require password, since PostgreSQL
doesn't require password for accessing a database that belongs to the PostgreSQL
user that has the same name as host operating system user, by default.

### Executing Postgres commands

Add a build command which looks something like:

```bash
psql -c "some command" -d $DATABASE_NAME_TEST -P pager
```

List of all packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.

### Extensions

- [PostGIS support on Semaphore](/docs/databases/postgis.html)
