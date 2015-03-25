---
layout: post
title: Setting up continuous integration for a Scala project on Semaphore
category: Scala
---

After creating your Semaphore account and linking it with a source code version
management service, be it [GitHub](/docs/adding-your-github-project-to-semaphore.html)
or [BitBucket](/docs/adding-your-bitbucket-project-to-semaphore.html), you're
ready to add a Scala project.

As an example, we will use a popular open source project written in Scala called
[gitbucket](https://github.com/takezoe/gitbucket). It is a clone of GitHub,
supporting the majority of its [features](https://github.com/takezoe/gitbucket#features).
If you want to follow along, just [fork](https://help.github.com/articles/fork-a-repo/)
the repository to your GitHub account.

We will add the forked project to Semaphore.

<img src="/docs/assets/img/languages/scala/scala-repo-host.png" class="img-responsive">

Selecting GitHub will reveal a list of projects which we can add to Semaphore.

<img src="/docs/assets/img/languages/scala/scala-select-repo.png" class="img-responsive">

After selecting `gitbucket`, Semaphore will analyze the added project and suggest
a common command which will run during the build. The command can be [customized]
(/docs/customizing-build-commands.html) afterwards at any time in the project's
settings.

<img src="/docs/assets/img/languages/scala/scala-analysis-result.png" class="img-responsive">

In this case, we don't have to alter the build command. The last step of the
process is to launch our build.

<img src="/docs/assets/img/languages/scala/scala-first-build.png" class="img-responsive">

The Scala project is now set up for continuous integration, leveraging the
[benefits](https://semaphoreci.com/community/tutorials/continuous-integration) of
this agile practice.
