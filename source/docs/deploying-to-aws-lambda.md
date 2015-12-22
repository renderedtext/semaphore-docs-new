---
layout: post
title: Deploying to AWS Lambda
category: Deploying your application
---

Amazon Web Services (AWS) is a set of cloud services that help you manage your
web applications, servers, databases and more. AWS Lambda is a compute service
to which you can upload your code, and then the service can run the code on
your behalf using AWS infrastructure.

Semaphore has a built-in integration which makes continuous deployment to AWS
Lambda very easy. This guide shows you how you can set it up and assumes that
you already have an application that is configured on AWS Lambda.

To get started, click on _Set Up Deployment_ on your project page on Semaphore.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/256/Screen_Shot_2015-12-16_at_4.20.48_PM.png"
alt="Set Up Deployment" class="img-responsive img-bordered">

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

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/221/Screen_Shot_2015-12-11_at_9.24.17_AM.png"
alt="Lambda Deployment " class="img-responsive img-bordered">

## Choosing the branch

In this step, you need to choose from which branch you wish to deploy your
application.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/223/Screen_Shot_2015-12-11_at_9.24.29_AM.png"
alt="AWS Lambda choose branch" class="img-responsive img-bordered">

## Entering the AWS credentials

On the following screen, enter your AWS credentials. If you need help getting
these credentials, consult the "Retrieving Security Credentials" section of
Semaphore's <a href="https://semaphoreci.com/community/tutorials/how-to-deploy-a-ruby-on-rails-application-to-elastic-beanstalk-with-semaphore" alt="How to Deploy a Ruby on Rails Application to Elastic Beanstalk with Semaphore">
tutorial on deploying a web application on Elastic Beanstalk</a>. The process for
retrieving credentials is the same when deploying to Lambda.

After entering the credentials, select the region your application resides in
on the same screen. This will enable Semaphore to list the functions in the
region you specified.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/224/Screen_Shot_2015-12-11_at_9.24.55_AM.png"
alt="Enter AWS Credentials" class="img-responsive img-bordered">

## Selecting the function

Next, you can choose the Lambda function to which you wish to deploy your code.
Also, there are suggested commands for installing dependencies in your project.
This is needed because Lambda needs all the source files of the packages you
use in your project.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/225/Screen_Shot_2015-12-11_at_9.25.29_AM.png"
alt="Selecting the Lambda function" class="img-responsive img-bordered">

## Naming your server on Semaphore

In this step, you need to provide a name for your server, which can be any name
of your choice. It will be used on your Semaphore dashboard and deployment
timeline. During this step, you may also choose to set a server URL for quick
access on Semaphore.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/226/Screen_Shot_2015-12-11_at_9.26.02_AM.png"
alt="Naming your server" class="img-responsive img-bordered">

The setup is now complete - you are ready to automatically deploy to Lambda.
All you need to do is click on _Deploy_.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/227/Screen_Shot_2015-12-11_at_9.26.14_AM.png"
alt="Ready to deploy" class="img-responsive img-bordered">
