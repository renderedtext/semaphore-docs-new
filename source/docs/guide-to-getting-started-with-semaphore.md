---
layout: post
title: Getting started with Semaphore
category: Getting started
---

- [Adding a project](#adding_a_project)
- [Debugging failed builds](#debugging_failed_builds)
- [Managing branches and pull requests](#managing_branches_and_pull_requests)
- [Customizing your CI](#customizing_your_ci)
- [Using Semaphore with Docker](#using_semaphore_with_docker)
- [Running tests in parallel to speed up your CI](#running_tests_in_parallel_to_speed_up_your_ci)
- [Setting up Continuous deployment](#setting_up_continuous_deployment)
- [Tutorials on TDD, BDD and DevOps](#tutorials_on_tdd_bdd_and_devops)
- [Rails Testing Handbook](#rails_testing_handbook)

## <a name="adding_a_project" href="#adding_a_project">Adding a project</a>

To get started, you need to add your first GitHub or Bitbucket project to Semaphore.

<img src="/docs/assets/img/guide/add_a_project.png" class="img-responsive img-bordered">

Need help? [Read our step-by-step tutorial.](/docs/adding-github-bitbucket-project-to-semaphore.html)

## <a name="debugging_failed_builds" href="#debugging_failed_builds">Debugging failed builds</a>

A red build can be discouraging. To debug a failed build on Semaphore, you can launch
an SSH session by clicking on the “Launch SSH” button within build results.
To learn more, check out our [detailed how-to guide](/docs/ssh-access-to-build-environment.html).

## <a name="managing_branches_and_pull_requests" href="#managing_branches_and_pull_requests">Managing branches and pull requests</a>

Working with branches on Semaphore is easy. Semaphore automatically recognizes
every newly pushed branch, adds it to your project, and runs a build for the latest
commit. Every time you push to that branch, Semaphore will trigger a new build.
If you delete the branch, it will be removed from Semaphore too.

Each pull request on GitHub/Bitbucket will display the build status of the given
branch, which shows if tests are passing, and if the branch can be safely merged.

Semaphore also lets you set up more fine-grained control over how CI works with
branches. You can:

* Tell Semaphore to automatically cancel queued builds (if you push many times in
a row to the same branch, you may not want to wait for build results from each
one of them),
* Specify a whitelist of branches to build automatically and ignore the rest, or
* Completely turn off automatic building for new branches.

You can configure all of this in Project Settings > Branches.

If you'd like to learn more about organizing your branching workflow, read our
tutorial [Elements of a Continuous Deployment Workflow] (https://semaphoreci.com/community/tutorials/elements-of-a-continuous-deployment-workflow),
which is based on how we work on Semaphore.

Here are a few more quick tips:

* To rebuild the latest build on any branch, click on the branch name on your project,
and then on “Rebuild last revision”.
* You can open a pull request on your repository list directly from a passed build
page, via the "Create pull request" button in the top right corner.
* You can manually add a branch to your project by clicking on the “plus” sign at
the top of your project’s branch list.

## <a name="customizing_your_ci" href="#customizing_your_ci">Customizing your CI</a>

Semaphore's platform is very flexible:

* It includes all major runtimes for most programming languages, databases, web
browsers,[and more](/docs/supported-stack.html).You have access to the full software
stack, regardless of your project's configuration. For example Ruby projects can
set a custom Node.js versions with nvm.
* You can run arbitrary programs within your builds and deploys.
* You have sudo access, so you can install pretty much anything that runs on Linux.
* Semaphore exports a number of [environment variables](/docs/available-environment-variables.html) you
can use in your configure, build, test and deploy scripts.
* The platform is based on Ubuntu 14.04 LTS and is updated monthly. Each update
consists of a release candidate period lasting for one week, after which the
updated is active for all users. This is communicated through the [Semaphore changelog](/docs/platform-changelog.html), and in-app notifications.

[The build command editor](/docs/customizing-build-commands.html)
lets you customize the setup of your build pipeline, enable parallel threads, and
set up post-thread commands that run on both success and failure.

## <a name="using_semaphore_with_docker" href="#using_semaphore_with_docker">Using Semaphore with Docker</a>

Semaphore provides native support for building, testing and deploying apps made
with Docker.

If you're new to Docker, you can learn from our growing collection of [in-depth
tutorials in the Semaphore Community](https://semaphoreci.com/community/tags/docker).

To start running your Docker project, all you need to do is [add it on Semaphore](https://semaphoreci.com/projects/choose_repo_host). After a brief analysis
of your Git repository, Semaphore will pre-select the Docker-enabled platform, and
you’ll be ready to use the Docker CLI tools in your builds and deploys. The
Docker-enabled platform can also be selected in Project Settings > Platform.

Semaphore will also [cache your Docker images](/docs/docker/docker-layer-caching.html)
to ensure that your builds are only doing what they're meant to, and that the time
needed for dependency resolving is minimal.

For most up-to-date information about our Docker platform, you can [refer to our documentation page](/docs/docker.html). The following guides can help
you get started:

* [Setting up continuous integration for a Docker project](/docs/docker/setting-up-continuous-integration-for-docker-project.html)
* [Testing multi-container applications with Docker Compose](/docs/docker/testing-multicontainer-apps-with-docker-compose-and-semaphore.html).

Semaphore also provides in-app integrations with most popular Docker registries,
which will take care of the authentication process for you. —
[Amazon EC2 Container registry](/docs/docker/continuous-delivery-aws-container-registry.html), [Docker Hub](/docs/docker/continuous-delivery-docker-hub.html), [Google Container registry](/docs/docker/continuous-delivery-google-container-registry.html), [Heroku Container Registry](/docs/docker/continuous-delivery-heroku-container-registry.html), [Quay.io](/docs/docker/continuous-delivery-quayio.html), and [custom or self-hosted container registries](/docs/docker/continuous-delivery-on-premise-container-registry.html).

## <a name="running_tests_in_parallel_to_speed_up_your_ci" href="#running_tests_in_parallel_to_speed_up_your_ci">Running tests in parallel to speed up your CI</a>

Speeding up your builds on Semaphore is easy:

* [Run tests in parallel](/docs/running-tests-in-parallel.html).
Schedule different parts of your test suite in parallel threads to save time.
* If you have a Rails application, you don't have to parallelize your tests
manually — with Semaphore Boosters, you can [automatically parallelize your Rails CI build in a few clicks](/docs/about-boosters.html).
* Semaphore automatically caches and reuses your repository and ditch recognized
dependencies between builds. You can also [use the same cache for additional purposes](/docs/caching-between-builds.html).

## <a name="setting_up_continuous_deployment" href="#setting_up_continuous_deployment">Setting up Continuous deployment</a>

In addition to continuous integration, Semaphore can also [continuously deploy your application](/docs/continuous-deployment-options.html) when
all tests pass on the branch associated with an automatic deployment.

Even if you would rather deploy manually, you can quickly set up a target server
and let anyone in the team deploy with one click. This will let you track releases
over time.

To get started, click on the "Set Up Deployment" button on your project page to
add your first server.

<img src="/docs/assets/img/guide/deployment.png" class="img-responsive img-bordered">

You can use custom deployment commands and scripts with the "Generic" method, and
you'll also find wizards for AWS, Heroku and more.

## <a name="tutorials_on_tdd_bdd_and_devops" href="#tutorials_on_tdd_bdd_and_devops">Tutorials on TDD, BDD and DevOps</a>

[Semaphore Community](https://semaphoreci.com/community) is a collection of tutorials
and interviews on continuous delivery practices and tools for various programming
languages, written by Semaphore engineers and contributors from the community.
You can take a look at all categories and [read tutorials about the technologies of your choice](https://semaphoreci.com/community/tags).

We recommend you to read a few general practice tutorials:

* [Why We Need Continuous Integration](https://semaphoreci.com/community/tutorials/continuous-integration)
* [Behavior-driven Development](https://semaphoreci.com/community/tutorials/behavior-driven-development)
* [How to Deal With and Eliminate Flaky Tests](https://semaphoreci.com/community/tutorials/how-to-deal-with-and-eliminate-flaky-tests)

## <a name="rails_testing_handbook" href="#rails_testing_handbook">Rails Testing Handbook</a>

After publishing many [Ruby tutorials](https://semaphoreci.com/community/tags/ruby)
focused on TDD/BDD, as well as tutorials for many other languages, we’ve decided
to write a handbook encompassing everything a developer needs to build sustainable
Rails apps.

In Rails Testing Handbook, you’ll learn about:

* How to get in the BDD mindset and apply it in practice;
* Setting up RSpec, Cucumber, database cleaner and others;
* Developing features from scratch in red-green-refactor cycles;
* Writing integration tests as Cucumber scenarios;
* Writing controller tests using RSpec with mocking approach;
* Writing model specs with RSpec;
* How to collaborate via pull requests and continuous integration.

The book is free, and you can download it [here](https://semaphoreci.com/ebooks/rails-testing-handbook).

This should be all you need to get started with building and deploying your application
with Semaphore. If you have any questions or need some more hands-on assistance,
[our support engineers are here to answer your questions](https://semaphoreci.com/support).

Happy building!
