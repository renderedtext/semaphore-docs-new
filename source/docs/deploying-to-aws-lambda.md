---
layout: post
title: Deploying to AWS Lambda
category: Deploying your application
---

Amazon Web Services (AWS) is a set of cloud services that help you manage your
web applications, servers, databases and more. AWS Lambda is a compute service
to which you can upload your code, and then the service can run the code on
your behalf using AWS infrastructure.

Semaphore Classic has a built-in integration which makes continuous deployment to AWS
Lambda very easy. This guide shows you how you can set it up and assumes that
you already have an application that is configured on AWS Lambda.

To get started, click on _Set Up Deployment_ on your project page on Semaphore Classic.


## Choosing the deployment strategy

There are two deployment strategies on Semaphore: "automatic" and "manual".

**Automatic** means that a deploy will be triggered after every passed build on
the selected branch. In addition, you can also manually deploy any build from
any branch at any time.

The **Manual** strategy requires the manual selection of the builds to deploy.

For automatic deployment, you will be asked to select which branch will be
automatically deployed after each passed build.

**Note**: You can easily change the deployment strategy from server settings at
any time once the setup is complete.


## Choosing the branch

In this step, you need to choose from which branch you wish to deploy your
application.


## Entering the AWS credentials

On the following screen, enter your AWS credentials. If you need help getting
these credentials, consult the "Retrieving Security Credentials" section of
Semaphore's <a href="https://semaphoreci.com/community/tutorials/how-to-deploy-a-ruby-on-rails-application-to-elastic-beanstalk-with-semaphore" alt="How to Deploy a Ruby on Rails Application to Elastic Beanstalk with Semaphore">
tutorial on deploying a web application on Elastic Beanstalk</a>. The process for
retrieving credentials is the same when deploying to Lambda.

After entering the credentials, select the region your application resides in
on the same screen. This will enable Semaphore to list the functions in the
region you specified.


## Selecting the function

Next, you can choose the Lambda function to which you wish to deploy your code.
Also, there are suggested commands for installing dependencies in your project.
This is needed because Lambda needs all the source files of the packages you
use in your project.


## Naming your server on Semaphore

In this step, you need to provide a name for your server, which can be any name
of your choice. It will be used on your Semaphore Classic dashboard and deployment
timeline. During this step, you may also choose to set a server URL for quick
access on Semaphore.

The setup is now complete - you are ready to automatically deploy to Lambda.
All you need to do is click on _Deploy_.


## Environment variables exported with Lambda integration

You can view [which environment variables are exported during deploy to Lambda](/docs/available-environment-variables.html#aws-lambda-variables),
together with some [common AWS environment variables](/docs/available-environment-variables.html#common-aws-variables).
