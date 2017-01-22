---
layout: post
title: Deploy to AWS Elastic Beanstalk
category: Deploying your application
---

Amazon Web Services (AWS) is a set of cloud services that help you manage your
web applications, servers, databases and more. <a href="http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/Welcome.html" rel="nofollow">Elastic Beanstalk</a>
is a platform which brings together various other AWS services. The idea behind
Elastic Beanstalk is that users don't have to worry about the infrastructure
that runs their applications.

Semaphore has a built-in integration, which makes continuous deployment to
AWS Elastic Beanstalk very easy. This guide shows you how to set it up,
and assumes that you have an application that is already configured on Elastic
Beanstalk. We recommend [creating a user for Semaphore on AWS IAM](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)
and attaching a custom policy provided at the end of this article.

To get started, click on _Set Up Deployment_ on your project page on Semaphore.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/172/Screen_Shot_2015-10-23_at_4.45.18_PM.png"
alt="Set Up Deployment" class="img-responsive img-bordered">

## Choosing the deployment method

The first step is to choose Elastic Beanstalk as your deployment method.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/104/Screen_Shot_2015-10-01_at_11.14.59_AM.png"
alt="Choose Deployment method" class="img-responsive img-bordered">

There are two deployment strategies on Semaphore: "automatic" and "manual".

**Automatic** means that a deploy will be triggered after every passed build on
the selected branch. In addition, you can also manually deploy any build from
any branch at any time.

The **Manual** strategy requires manual selection of the builds to deploy.

For automatic deployment, you will be asked to select which branch will be
automatically deployed after each passed build.

**Note**: You can easily change the deployment strategy from server settings at
any time after the setup is complete.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/105/Screen_Shot_2015-10-01_at_11.15.39_AM.png"
alt="Choose strategy" class="img-responsive img-bordered">

## Choosing the branch

In this step, you need to choose from which branch you wish to deploy your
application.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/106/Screen_Shot_2015-10-01_at_11.16.08_AM.png"
alt="Choose branch" class="img-responsive img-bordered">

## Entering the AWS credentials

On the following screen, enter your AWS credentials. If you need help getting
these credentials, consult the "Retrieving Security Credentials" section of
Semaphore's <a href="https://semaphoreci.com/community/tutorials/how-to-deploy-a-ruby-on-rails-application-to-elastic-beanstalk-with-semaphore" alt="How to Deploy a Ruby on Rails Application to Elastic Beanstalk with Semaphore">tutorial
on deploying a web application on Elastic Beanstalk</a>.

After entering the credentials, select the region your application resides in
on the same screen. This will enable Semaphore to list the applications and
environments you have in the region you specified.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/107/Screen_Shot_2015-10-01_at_11.11.25_AM.png"
alt="Enter AWS Credentials" class="img-responsive img-bordered">

## Selecting the Application and the Environment

Next, you can choose your target application and its environment where your code
will be deployed. You will also need to choose the S3 Bucket where Semaphore
will upload your application's .zip file in order to trigger deployment to AWS
Elastic Beanstalk.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/152/Screen_Shot_2015-10-15_at_10.58.01_AM.png"
alt="Select target application" class="img-responsive img-bordered">

## Configuring the database

If your application is using a database, you can configure it in this step.
You will need to specify the database adapter your application is using, as well
as the database environment in which it is configured to run on AWS.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/115/db-setup.png"
alt="Configure the database" class="img-responsive img-bordered">

## Naming your server on Semaphore

In this step, you need to provide a name for your server, which can be any name
of your choice. It will be used on your Semaphore dashboard and deployment
timeline. During this step, you may also choose to set a server URL for quick
access on Semaphore.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/145/Screen_Shot_2015-10-12_at_2.11.50_PM.png"
alt="Naming your server" class="img-responsive img-bordered">

The setup is now complete - you are ready to automatically deploy to Elastic
Beanstalk. All you need to do is click "Deploy".

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/146/Screen_Shot_2015-10-12_at_2.12.38_PM.png"
alt="Ready to deploy" class="img-responsive img-bordered">

Happy building!

## Example AWS IAM policy

This example shows a policy which provides Semaphore with access to manage your
Elastic Beanstalk applications and environments. [This
section](http://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-using.html#create-managed-policy-console)
of AWS documentation explains how to create a custom policy. You can copy the
policy shown below, but you must update the `[region]` and `[user-or-group-id]` placeholders accordingly for your configuration.

```javascript
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:DeleteObject",
                "s3:GetBucketLocation",
                "s3:GetBucketPolicy",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:GetObjectVersion",
                "s3:ListBucket",
                "s3:ListAllMyBuckets",
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:PutObjectVersionAcl"
            ],
            "Resource": [
                "arn:aws:s3:::*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "elasticbeanstalk:CreateApplicationVersion",
                "elasticbeanstalk:DeleteApplicationVersion",
                "elasticbeanstalk:Describe*",
                "elasticbeanstalk:ListAvailableSolutionStacks",
                "elasticbeanstalk:RequestEnvironmentInfo",
                "elasticbeanstalk:UpdateApplicationVersion",
                "elasticbeanstalk:UpdateEnvironment"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "cloudformation:CancelUpdateStack",
                "cloudformation:GetTemplate",
                "cloudformation:Describe*",
                "cloudformation:UpdateStack"
            ],
            "Resource": [
                "arn:aws:cloudformation:[region]:[user-or-group-id]:*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeImages",
                "ec2:DescribeKeyPairs"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeScalingActivities",
                "autoscaling:ResumeProcesses",
                "autoscaling:SuspendProcesses"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "elasticloadbalancing:RegisterInstancesWithLoadBalancer"
            ],
            "Resource": [
                "arn:aws:elasticloadbalancing:*:*:*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "rds:Describe*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "sns:GetTopicAttributes",
                "sns:ListSubscriptionsByTopic"
            ],
            "Resource": "arn:aws:sns:[region]:[user-or-group-id]:*"
        }
    ]
}
```
