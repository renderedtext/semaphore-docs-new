---
layout: post
title: Adding your Bitbucket project to Semaphore
category: Getting started
---
Setting up continuous integration for a Bitbucket project and running your
first build on Semaphore is easy and takes only a few clicks.

<img src="/docs/assets/img/bitbucket/select-repo-host.png" class="img-responsive">


After you click to add a new project, select Bitbucket as your repository host.  Next you will be redirected 
to Bitbucket to authorize Semaphore to access your projects. Keep in mind that Bitbucket only supports giving access to
[both private and public repositories](https://confluence.atlassian.com/display/BITBUCKET/OAuth+FAQ#OAuthFAQ-DoIhavegranularcontrolofOAuthpermissions%28scopes%29).
Once you confirm permission access, Semaphore will present you with a list of your Bitbucket repositories.

<img src="/docs/assets/img/bitbucket/bitbucket-project-list.png" class="img-responsive">

In the next steps you will select Bitbucket repository, branch to build and
the Semaphore account that you want the repository to be attached to. Note
that in order to add some repository from Bitbucket, user has to be either its
creator or to belong to a Bitbucket group that has admin rights to the specific
repository.

After that Semaphore will perform a quick analysis of the source code and
generate a set of working build commands depending on your project's programming
language.

<img src="/docs/assets/img/bitbucket/analyse-results.png" class="img-responsive">

At this point you'll be ready to launch your first build.
