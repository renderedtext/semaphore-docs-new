---
layout: post
title: Continuous Deployment Options
category: Deploying your application
---

Semaphore lets you continuously deploy your applications and services when all
automated tests pass. This way, developers only need to push new code to a Git
repository in order for Semaphore to run all tests and deploy a new version.

To accomplish this is very easy. You only need to set up a target **server**, an
entity which encapsulates deployment settings and history on Semaphore. The
server can be linked to a particular branch, and it will trigger deployment
after every successful build on that branch.

Note: It is also possible to set up a deployment server without continuous
deployment and perform manual, one-click deployment from any branch.

Servers, which can be accessed from project pages, display a detailed deploy
history in a form similar to a changelog. This way, your team can keep track of
who delivered what and when.

<img src="https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/273/continuous-deployment-server-page-semaphoreci.png" class="img-bordered-padding img-responsive" alt="Continuous deployment changelog">

In addition, each deploy can trigger a [notification in your favorite group chat
channel](/docs/managing-chat-notifications.html).

Both automatic and manual deployment workflows are a significant improvement
over launching deploys from individual developers' local machines and
ad-hoc communication. They also empower new team members to deploy their first
contributions on their first day at the job quickly and without friction.

### Guides to help you set up deployment

The following guides show you how to set up deployment to one of the cloud
platforms and tools Semaphore integrates with. If your service is not listed, or
you have custom scripts and infrastructure, we recommend going with the [Generic
deployment method](/docs/generic-deployment.html).

- <a href="/docs/deploying-to-heroku.html">Deploying to Heroku</a></li>
- <a href="/docs/deploying-via-cloud66.html">Deploying via Cloud 66</a></li>
- <a href="/docs/deploying-with-capistrano.html">Deploying with Capistrano</a></li>
- <a href="/docs/deploying-to-aws-elastic-beanstalk.html">Deploying to AWS Elastic Beanstalk</a></li>
- <a href="/docs/deploying-to-amazon-s3.html">Deploying to Amazon S3</a></li>
- <a href="/docs/deploying-to-aws-lambda.html">Deploying to AWS Lambda</a></li>
- <a href="/docs/deploying-with-git-deploy.html">Deploying with git-deploy</a></li>
- <a href="/docs/ftp-deployment.html">FTP deployment</a></li>

We also very much welcome any <a
href="mailto:semaphore@renderedtext.com">feedback</a> you may have, as well as
suggestions which deployment integrations you would like to see next.
