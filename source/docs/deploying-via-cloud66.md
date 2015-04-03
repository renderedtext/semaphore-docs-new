---
layout: post
title: Deploying via Cloud 66
category: Deploying your application
---

[Cloud 66](https://www.cloud66.com) makes it easy to provision, deploy and manage your Ruby on Rails application on any cloud. Semaphore has native integration for deployment through Cloud 66.

Make sure your stack is deployed with Cloud 66. Learn more about [deploying Rails stacks with Cloud 66](https://www.cloud66.com/help/first_stack).

In Semaphore, go to your project setting and click on Deployment.

<img src="/docs/assets/img/cloud66-integration/project_settings.png" class="img-responsive">

If you have no deployments configured, you can add your first server.

<img src="/docs/assets/img/cloud66-integration/project_settings_deployment.png" class="img-responsive">

Select Cloud 66 from the list of Deployment Methods and choose Automatic.

<img src="/docs/assets/img/deployment-method.png" class="img-responsive">

You will be redirected to your Cloud 66 account and asked if you give Semaphore permission to deploy your stacks on your behalf.

<img src="/docs/assets/img/cloud66-integration/oauth_access_rights.png" class="img-responsive">


Select the project you would like to deploy once the tests are successful.

__Done!__

Note that while Semaphore tracks every deploy in the project timeline, it sends a blank request to Cloud66 to perform the actual deployment work. If it fails for some reason, Cloud 66 will inform you.
