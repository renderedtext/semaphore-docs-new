---
layout: post
title: Available Environment Variables
category: The Semaphore platform
---

Semaphore exports different environment variables depending on your setup and whether
it's a build or a deploy. These are different environment variables that are exported:

- [Variables exported in builds and deploys](#variables-exported-in-builds-and-deploys)
- [Variables available only for pull requests originating from forks](#variables-available-only-for-pull-requests-originating-from-forks)
- [Variables available in deploys only](#variables-available-in-deploys-only)
- [Variables exported in deployment integrations](#variables-exported-in-deployment-integrations)
    - [Common AWS variables](#common-aws-variables)
    - [AWS Elastic Beanstalk Variables](#aws-elastic-beanstalk-variables)
    - [AWS S3 Variables](#aws-s3-variables)
    - [AWS Lambda Variables](#aws-lambda-variables)
- [Locale variables](#locale-variables)
- [Variables in Ruby projects with databases](#variables-in-ruby-projects-with-databases)


## Variables exported in builds and deploys

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
      <td>Eg. master, pull-request-7</td>
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
      <td>SEMAPHORE_JOB_RESULT</td>
      <td>Eg. failed</td>
    </tr>
    <tr>
      <td>SEMAPHORE_CURRENT_JOB</td>
      <td>Eg. 1</td>
    </tr>
    <tr>
      <td>SEMAPHORE_JOB_COUNT</td>
      <td>Eg. 4</td>
    </tr>
    <tr>
      <td>SEMAPHORE_TRIGGER_SOURCE</td>
      <td>Eg. push, manual, api,  scheduler</td>
    </tr>
  </tbody>
</table>

## Variables available only for [pull requests originating from forks](/docs/building-pull-requests.html):

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

## Variables available in deploys only

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
  </tbody>
</table>

## Variables exported in deployment integrations

Semaphore offers [multiple deployment
integrations](/docs/continuous-deployment-options.html)
to make it easy to deploy to your provider. These are exported
during deploy phase of your project.

### Common AWS Variables

These variables are exported in all AWS deployment integrations.

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>AWS_ACCESS_KEY_ID</td>
      <td>Eg. 123kjsfa1902rl</td>
    </tr>
    <tr>
      <td>AWS_SECRET_ACCESS_KEY</td>
      <td>Eg. as9tr813kjfgasll2123kjsfa1902rl</td>
    </tr>
    <tr>
      <td>AWS_DEFAULT_REGION</td>
      <td>Eg. us-west-2</td>
    </tr>
  </tbody>
</table>

### AWS Elastic Beanstalk Variables

Together with the common [AWS variables](#common-aws-variables), Semaphore exports
also these variables:

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>S3_BUCKET_NAME</td>
      <td>Eg. my-bucket - name of the bucket where your application zip file will be uploaded</td>
    </tr>
    <tr>
      <td>EB_APP_NAME</td>
      <td>Eg. my-elasticbeanstalk-app - application name you're deploying to on Elastic Beanstalk</td>
    </tr>
    <tr>
      <td>EB_ENV_NAME</td>
      <td>Eg. production - name of the environment you're deploying to on Elastic Beanstalk</td>
    </tr>
    <tr>
      <td>EB_DB_ADAPTER</td>
      <td>Eg. pg - type of the database you're using on Elastic Beanstalk</td>
    </tr>
    <tr>
      <td>EB_DB_ENV</td>
      <td>Eg. production - name of the database environment you're deploying to on Elastic Beanstalk</td>
    </tr>
  </tbody>
</table>

### AWS S3 Variables

Together with the common [AWS variables](#common-aws-variables), Semaphore exports
also these variables:

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>S3_BUCKET_NAME</td>
      <td>Eg. my-bucket - name of the bucket where your application zip file will be uploaded</td>
    </tr>
    <tr>
      <td>S3_INDEX_DOC</td>
      <td>Eg. index.html - entry point of your S3 website</td>
    </tr>
    <tr>
      <td>S3_DIRECTORY</td>
      <td>Eg. docs - name of the directory you want to upload from your repository to S3</td>
    </tr>
  </tbody>
</table>

### AWS Lambda Variables

Together with the common [AWS variables](#common-aws-variables), Semaphore exports
also this variable:

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>LAMBDA_FUNCTION_NAME</td>
      <td>Eg. my-cool-function - name of the function on AWS Lambda</td>
    </tr>
  </tbody>
</table>

### Heroku

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>HEROKU_API_KEY</td>
      <td>Eg. 12139243 - when deploying to Heroku</td>
    </tr>
  </tbody>
</table>

## Locale variables

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

## Variables in Ruby projects with databases

The following variables are available to Ruby projects with selected MySQL or
PostgreSQL database in project settings. The same values are used in
`config/database.yml` that is automatically generated for your project. You can
also use them in any custom script that your build depends on:

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

Rails users, note that Semaphore does not set `RAILS_ENV` or `RACK_ENV`. On
one occasion we did start setting them to "test" but too many projects
experienced unexpected problems.
