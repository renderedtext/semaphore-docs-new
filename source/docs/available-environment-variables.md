---
layout: post
title: Available Environment Variables
category: The Semaphore platform
---

Before running your build or deploy, Semaphore exports the following environment variables:

<table class="table table-striped table-bordered">
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
      <td>Eg. master</td>
    </tr>
    <tr>
      <td>REVISION</td>
      <td>Eg. 6375073ec483bd2d949fad188d1ab869</td>
    </tr>
    <tr>
      <td>WKHTMLTOPDF_PATH</td>
      <td>/usr/local/bin/wkhtmltopdf</td>
    </tr>
    <tr>
      <td>SEMAPHORE_PROJECT_DIR</td>
      <td>Eg. /home/runner/my_app</td>
    </tr>
    <tr>
      <td>SEMAPHORE_CACHE_DIR</td>
      <td>Eg. /home/runner/my_app/.semaphore-cache</td>
    </tr>
    <tr>
      <td>SEMAPHORE_PROJECT_HASH_ID</td>
      <td>Eg. 18670db3bd1c017cb5fc6013bec1d75d3</td>
    </tr>
    <tr>
      <td>SEMAPHORE_PROJECT_NAME</td>
      <td>Eg. Base-app</td>
    </tr>
    <tr>
      <td>SEMAPHORE_BRANCH_ID</td>
      <td>Eg. 85726</td>
    <tr>
      <td>SEMAPHORE_BUILD_NUMBER</td>
      <td>Eg. 23</td>
    </tr>
    <tr>
      <td>SEMAPHORE_REPO_SLUG</td>
      <td>Eg. rastasheep/my_project</td>
    </tr>
    <tr>
      <td>SEMAPHORE_THREAD_RESULT</td>
      <td>Eg. failed</td>
    </tr>
    <tr>
      <td>SEMAPHORE_CURRENT_THREAD</td>
      <td>Eg. 1</td>
    </tr>
    <tr>
      <td>SEMAPHORE_THREAD_COUNT</td>
      <td>Eg. 4</td>
    </tr>
    <tr>
      <td>SEMAPHORE_TRIGGER_SOURCE</td>
      <td>Eg. push, manual, api,  scheduler</td>
    </tr>
  </tbody>
</table>

Variables available only for pull requests:

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>PULL_REQUEST_NUMBER</td>
      <td>Eg. 121</td>
    </tr>
  </tbody>
</table>

Variables available only during deployment:

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>SEMAPHORE_DEPLOY_NUMBER</td>
      <td>Eg. 17</td>
    </tr>
    <tr>
      <td>SEMAPHORE_SERVER_NAME</td>
      <td>Eg. staging</td>
    </tr>
    <tr>
      <td>DEPLOY_AUTHOR_NAME</td>
      <td>Semaphore username or commit author</td>
    </tr>
    <tr>
      <td>HEROKU_API_KEY</td>
      <td>Eg. 12139243 - when deploying to Heroku</td>
    </tr>
  </tbody>
</table>

Semaphore sets the following locale:

<table class="table table-striped table-bordered">
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

The following variables are available to Ruby projects with selected MySQL or PostgreSQL database in project settings. The same values are used in `config/database.yml` that is automatically generated for your project. You can also use them in any custom script that your build depends on:

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>DATABASE_USERNAME</td>
      <td>runner</td>
    </tr>
    <tr>
      <td>DATABASE_NAME_DEVELOPMENT</td>
      <td>Eg. 18671ad3b3r7bec1d75d3_development</td>
    </tr>
    <tr>
      <td>DATABASE_NAME_TEST</td>
      <td>Eg. 18671ad3b3rVa5fc6017bec1d75d3_test</td>
    </tr>
    <tr>
      <td>DATABASE_PASSWORD</td>
      <td>semaphoredb</td>
    </tr>
  </tbody>
</table>

If you need to create and manage custom database setup you can use following environment variables as credentials:

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>DATABASE_MYSQL_USERNAME</td>
      <td>root</td>
    </tr>
    <tr>
      <td>DATABASE_MYSQL_PASSWORD</td>
      <td>semaphoredb</td>
    </tr>
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

You can find more information about available databases on Semaphore [here](/docs/databases.html).

Rails users, note that Semaphore does not set `RAILS_ENV` or `RACK_ENV`.
On one occasion we did start setting them to "test" but too many projects
experienced unexpected problems.
