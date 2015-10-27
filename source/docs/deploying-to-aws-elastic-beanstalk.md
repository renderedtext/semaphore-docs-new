---
layout: post
title: Deploy to AWS Elastic Beanstalk
category: Deploying your application
---

Amazon Web Services (AWS) is a set of cloud services that help you manage your web applications,
servers, databases and more. <a href="http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html" rel="nofollow">Elastic Beanstalk</a>
is a platform which brings together various other AWS services. The idea behind
Elastic Beanstalk is that users doesn't have to worry about the infrastructure
that runs their applications.

Semaphore has a built-in integration which makes continuous deployment to
AWS Elastic Beanstalk very easy. This guide will show you how to set it up,
and assumes that you have an application already configured on Elastic Beanstalk.

To get started, on your project page on Semaphore follow the link to set up
deployment.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/172/Screen_Shot_2015-10-23_at_4.45.18_PM.png"
alt="Set up Deployment" class="img-responsive img-bordered">

## Choosing your deployment method

The first step is to choose Elastic Beanstalk as your deployment method.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/104/Screen_Shot_2015-10-01_at_11.14.59_AM.png"
alt="Choose Deployment method" class="img-responsive img-bordered">

There are two deployment strategies on Semaphore: "automatic" and "manual".

**Automatic** means that a deploy will be triggered after every passed build on
the selected branch. Besides that, you can also manually deploy any build from
any branch at any time.

**Manual** strategy requires manual selection of builds to deploy.

For automatic deployment you will be asked to select which branch will be
automatically deployed after each passed build.

**Note**: You can easily change the deployment strategy from server settings at
any time after the setup is complete.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/105/Screen_Shot_2015-10-01_at_11.15.39_AM.png"
alt="Choose strategy" class="img-responsive img-bordered">

## Choose branch

In this step you will choose from which branch you wish to deploy your application.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/106/Screen_Shot_2015-10-01_at_11.16.08_AM.png"
alt="Choose branch" class="img-responsive img-bordered">

## Enter AWS Credentials

On the following screen, enter your AWS credentials. If you need help getting
these credentials, consult the "Retrieving Security Credentials" in Semaphore's
<a href="https://semaphoreci.com/community/tutorials/how-to-deploy-a-ruby-on-rails-application-to-elastic-beanstalk-with-semaphore" alt="How to Deploy a Ruby on Rails Application to Elastic Beanstalk with Semaphore">tutorial for deploying a web application on Elastic Beanstalk</a>.

After entering the credentials, on the same screen, select the region your
application resides in. This will enable Semaphore to list the application and
environments you have in the region you specified.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/107/Screen_Shot_2015-10-01_at_11.11.25_AM.png"
alt="Enter AWS Credentials" class="img-responsive img-bordered">

## Select the Application and the Environment

Next you can choose your target application and its environment where your code will be deployed.
You will also need to choose S3 Bucket where Semaphore will upload your application's .zip file
in order to trigger deployment to AWS Elastic Beanstalk.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/152/Screen_Shot_2015-10-15_at_10.58.01_AM.png"
alt="Select target application" class="img-responsive img-bordered">

## Configuring the database

If your application is using a database you can configure it in this step.
You will need to specify database adapter your application is using, as well as
database environment in which it is configured to run on AWS.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/115/db-setup.png"
alt="Configure the database" class="img-responsive img-bordered">

## Naming your server on Semaphore

In this step you need to provide a name for your server, which can be any name
you like. It will be used on your Semaphore dashboard and deployment timeline.
During this step, you may also choose to set a server URL for quick access on
Semaphore.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/145/Screen_Shot_2015-10-12_at_2.11.50_PM.png"
alt="Naming your server" class="img-responsive img-bordered">

By now the setup is complete - you are ready to automatically deploy to Elastic Beanstalk.
All you need to do is click "Deploy".

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/146/Screen_Shot_2015-10-12_at_2.12.38_PM.png"
alt="Ready to deploy" class="img-responsive img-bordered">

Happy building!
