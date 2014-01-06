---
layout: post
title: Available Environment Variables
category: The Semaphore platform
---

Before running your build or deploy, Semaphore exports the following environment variables:

<table class="table table-striped">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>CI</td>
      <td>true</td>
    </tr>
    <tr>
      <td>SEMAPHORE</td>
      <td>true</td>
    </tr>
    <tr>
      <td>BRANCH_NAME</td>
      <td>% current branch name %</td>
    </tr>
    <tr>
      <td>REVISION</td>
      <td>% current branch name %</td>
    </tr>
    <tr>
      <td>WKHTMLTOPDF_PATH</td>
      <td>% current branch name %</td>
    </tr>
    <tr>
      <td>SEMAPHORE_CACHE_DIR</td>
      <td>/home/runner/my_project/.semaphore_cache</td>
    </tr>
    <tr>
      <td>SEMAPHORE_PROJECT_HASH_ID</td>
      <td>4567556213</td>
    </tr>
    <tr>
      <td>SEMAPHORE_PROJECT_NAME</td>
      <td>Base-app</td>
    </tr>
    <tr>
      <td>SEMAPHORE_BRANCH_ID</td>
      <td>Base-app</td>
    <tr>
      <td>SEMAPHORE_BUILD_NUMBER</td>
      <td>23</td>
    </tr>
    <tr>
      <td>SEMAPHORE_BUILD_NUMBER</td>
      <td>23</td>
    </tr>
    <tr>
      <td>SEMAPHORE_REPO_SLUG</td>
      <td>23</td>
    </tr>
    <tr>
      <td>SEMAPHORE_THREAD_RESULT</td>
      <td>failed</td>
    </tr>
  </tbody>
</table>

Available only for deployment:

<table class="table table-striped">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>SEMAPHORE_SERVER_NAME</td>
      <td>true</td>
    </tr>
    <tr>
      <td>HEROKU_API_KEY</td>
      <td>- available when deploying to Heroku</td>
    </tr>
  </tbody>
</table>

Semaphore sets the following locale:

<table class="table table-striped">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>LANG</td>
      <td>en_US.UTF-8</td>
    </tr>
    <tr>
      <td>LC_ALL</td>
      <td>en_US.UTF-8</td>
    </tr>
  </tbody>
</table>

The following apply if you are using a MySQL or PostgreSQL database. You can use them in any custom scripts that your build depends on:

<table class="table table-striped">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>DATABASE_USERNAME</td>
      <td>true</td>
    </tr>
    <tr>
      <td>DATABASE_NAME_DEVELOPMENT</td>
      <td>- available when deploying to Heroku</td>
    </tr>
    <tr>
      <td>DATABASE_NAME_TEST</td>
      <td>- available when deploying to Heroku</td>
    </tr>
    <tr>
      <td>DATABASE_PASSWORD</td>
      <td>- available when deploying to Heroku</td>
    </tr>
  </tbody>
</table>

If you need to create and manage custom database setup you can use following environment variables as credentials:

<table class="table table-striped">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>DATABASE_MYSQL_USERNAME</td>
      <td>true</td>
    </tr>
    <tr>
      <td>DATABASE_MYSQL_PASSWORD</td>
      <td>- available when deploying to Heroku</td>
    </tr>
    <tr>
      <td>DATABASE_POSTGRESQL_USERNAME</td>
      <td>- available when deploying to Heroku</td>
    </tr>
    <tr>
      <td>DATABASE_POSTGRESQL_PASSWORD</td>
      <td>- available when deploying to Heroku</td>
    </tr>
  </tbody>
</table>

More info about managing databases at Semaphore you can find [here](/docs/using-multiple-databases.html).

