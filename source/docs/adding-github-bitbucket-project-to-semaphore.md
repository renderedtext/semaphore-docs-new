---
layout: post
title: Adding your GitHub or Bitbucket project to Semaphore
category: Getting started
alias: ["docs/adding-your-github-project-to-semaphore.html", "docs/adding-your-bitbucket-project-to-semaphore.html"]
---

Setting up continuous integration for a project hosted on GitHub or Bitbucket
and running your first build on Semaphore is easy and takes only a few clicks.

If you don't already have a Semaphore account, [sign up](/users/sign_up) and
confirm your email address. The free account gives you unlimited CI service for
open-source projects and up to 100 private builds per month.

After you sign in on Semaphore for the first time, a welcome screen will prompt
you to add your first project. Click on the "Build a New Project" button to get
started.  If you have already added some projects on Semaphore, use the "Add new
project" link at the top of your dashboard.

<img src="/docs/assets/img/adding-new-project/build-new-project.png" class="img-responsive img-bordered">

The next step is to connect your Semaphore account with your GitHub and/or
Bitbucket account. This will allow Semaphore to do things like present you a
list of projects to choose from, fetch the chosen Git repositories, and update
pull request status. Select your preferred Git host.

<img src="/docs/assets/img/adding-new-project/select-github-or-bitbucket.png" class="img-responsive img-bordered">

We will now assume that you chose GitHub. On the next screen, select whether you
would like to give Semaphore access to your public (open-source) or
private projects. Access to private projects also includes access to public 
projects.

If you are using Bitbucket, this step does not exist because Bitbucket only supports
giving access to [both private and public
repositories](https://confluence.atlassian.com/display/BITBUCKET/OAuth+FAQ#OAuthFAQ-DoIhavegranularcontrolofOAuthpermissions%28scopes%29).
The rest of the procedure is the same as with GitHub.

<img src="/docs/assets/img/adding-new-project/choose-public-private-github-scope.png" class="img-responsive img-bordered">

At this point, Semaphore will redirect you to github.com or bitbucket.com, where
you will be presented a screen to authorize Semaphore to access your account via
OAuth. Click "Authorize application" to continue.

<img src="/docs/assets/img/adding-new-project/authorize-semaphore-for-github.png" class="img-responsive img-bordered">

Once you have confirmed permission access, Semaphore will present you with a
list of your repositories. If the list is very long, you can use the search box
located at the top to narrow it down.

A note for Bitbucket users: in order to add a repository, a user has to
either be its creator or belong to a Bitbucket group that has admin rights to it.

<img src="/docs/assets/img/adding-new-project/select-project.png" class="img-responsive img-bordered">

Select the branch you would like your first build to run from. Semaphore will
automatically test every new branch you create, and remove the ones you
delete in origin. Additional preexisting branches can be easily added from your
project page later on.

<img src="/docs/assets/img/adding-new-project/select-branch.png" class="img-responsive img-bordered">

Select the account which you would like to own this project. Besides your
personal account, any
[organizations](/organizations/setting-up-an-organization.html) where you have
admin or owner access will be listed here as well. For example, if you are
adding a project that should be billed to your company, you can add that project
 to your company's organization.

<img src="/docs/assets/img/adding-new-project/select-account.png" class="img-responsive img-bordered">

Next, Semaphore will perform a quick analysis of the source code and
generate a set of working build commands depending on your project's programming
language.

<img src="/docs/assets/img/adding-new-project/analysis-results.png" class="img-responsive img-bordered">

In this case, we have a Ruby on Rails application for which we would like to run
`bundle exec rake cucumber` in a second, parallel thread, so we'll select
"Thread #2" from the associated select box.

<img src="/docs/assets/img/adding-new-project/thread2.png" class="img-responsive img-bordered">

If your project needs to run commands that are different from what Semaphore has
suggested, just click on the "Customize build" link at the bottom of the
commands list to customize them to your needs.

At this point, you'll be ready to launch your first build. Click on "Build With
These Settings" to do so. If all goes well, you should see your first successful
build on Semaphore.

<img src="/docs/assets/img/adding-new-project/green-build.png" class="img-responsive img-bordered">

For more build customization options, please refer to our ["Customizing your
build" documentation section](/docs). Happy building!
