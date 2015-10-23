---
layout: post
title: Deploy via Elastic Beanstalk
category: Deploying your application
---

Amazon Web Services (AWS) is a set of web services that help you manage your web applications,
servers, databases and many more. <a href="http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html"
alt="What Is Elastic Beanstalk and Why Do I Need It?" target="_blank">Elastic Beanstalk</a>
is one of their services which brings together couple of services for managing your applications.
Idea behind Elastic Beanstalk is that users doesn't have to worry about the infrastructure that runs
behind their applications.

Being that easy for user to deploy their applications, we decided to make it even easier with
our Elastic Beanstalk deployment method.

To get started, go to your project's settings and under "Deployment" tab follow the link to
add a new server.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/172/Screen_Shot_2015-10-23_at_4.45.18_PM.png"
alt="Set up Deployment" class="img-responsive img-bordered">

This will lead you to a wizard for deployment to Elastic Beanstalk.

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

Enter the AWS credentials like described in <a href="https://semaphoreci.com/community/tutorials/how-to-deploy-a-ruby-on-rails-application-to-elastic-beanstalk-with-semaphore" alt="How to Deploy a Ruby on Rails Application to Elastic Beanstalk with Semaphore"
target="_blank">this tutorials</a> we made in "Retrieving Security Credentials" part.
Then you can select the region your application resides in.
This will enable Semaphore to list the application and environments you have in the region you specified.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/107/Screen_Shot_2015-10-01_at_11.11.25_AM.png"
alt="Enter AWS Credentials" class="img-responsive img-bordered">

## Select the Application and the Environment

Next you can choose your target application and its environment where your code will be deployed.
You will also need to choose S3 Bucket where Semaphore will upload your application's .zip file
in order to trigger deployment to AWS Elastic Beanstalk.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/152/Screen_Shot_2015-10-15_at_10.58.01_AM.png"
alt="Select target application" class="img-responsive img-bordered">

## Configuring the database

If your application has a database you can configure it in this step.
You will need to specify database adapter your application is using, as well as
database environment in which it will run.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/115/db-setup.png"
alt="Configure the database" class="img-responsive img-bordered">

## Naming your server on Semaphore

In this step you need to provide a name for your server, which can be any name
you like. It will be used on your Semaphore dashboard and deployment timeline.
During this step, you may also choose to set a server URL for quick access to
wherever you are deploying your application.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/145/Screen_Shot_2015-10-12_at_2.11.50_PM.png"
alt="Naming your server" class="img-responsive img-bordered">

By now the setup is complete - you are ready to automatically deploy to Elastic Beanstalk.
All you need to do is click "Deploy".

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/146/Screen_Shot_2015-10-12_at_2.12.38_PM.png"
alt="Ready to deploy" class="img-responsive img-bordered">

Happy building!
