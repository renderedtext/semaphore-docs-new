---
layout: post
title: Available Environment Variables
category: Customizing your build
---

Before running your build or deploy, Semaphore exports the following environment variables:

<pre>CI=true
SEMAPHORE=true
BRANCH_NAME=<current_branch_name>
REVISION
WKHTMLTOPDF_PATH
SEMAPHORE_CACHE_DIR
SEMAPHORE_PROJECT_HASH_ID
SEMAPHORE_PROJECT_NAME
SEMAPHORE_BRANCH_ID
SEMAPHORE_BUILD_NUMBER
SEMAPHORE_REPO_SLUG
SEMAPHORE_THREAD_RESULT
</pre>

Available only for deployment:

<pre>
SEMAPHORE_SERVER_NAME
HEROKU_API_KEY - when deploying to Heroku
</pre>

Semaphore sets the following locale:

<pre>
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8
</pre>

The following apply if you are using a MySQL or PostgreSQL database. You can use them in any custom scripts that your build depends on:

<pre>DATABASE_USERNAME
DATABASE_NAME_DEVELOPMENT
DATABASE_NAME_TEST
DATABASE_PASSWORD
</pre>

If you need to create and manage custom database setup you can use following environment variables as credentials:

<pre>
DATABASE_MYSQL_USERNAME
DATABASE_MYSQL_PASSWORD
DATABASE_POSTGRESQL_USERNAME
DATABASE_POSTGRESQL_PASSWORD
</pre>

More info about managing databases at Semaphore you can find [here](/docs/how-to-configure-database.html).

