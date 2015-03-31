---
layout: post
title: Setting up continuous integration for an Elixir project on Semaphore
category: Elixir
---

When your Semaphore account is created and linked with [GitHub](/docs/adding-your-github-project-to-semaphore.html)
or [BitBucket](/docs/adding-your-bitbucket-project-to-semaphore.html), you're
ready to setup continuous integration for your Elixir project.

In this example, we will use a fork of the [Phoenix Framework](https://github.com/phoenixframework/phoenix).
It is a web development framework aiming to provide a pleasant development
experience like Ruby on Rails and high performance using the Elixir programming
language. It comprises the top level of the flexible [Plug](https://github.com/elixir-lang/plug)
(middleware) and [Cowboy](https://github.com/ninenines/cowboy) (Erlang web server)
stack.

In the first step, we will choose GitHub as the source of our repository.

<img src="/docs/assets/img/languages/elixir/elixir-repo-host.png" class="img-responsive">

Once the projects are fetched from the connected GitHub account, we select `phoenix`.

<img src="/docs/assets/img/languages/elixir/elixir-select-project.png" class="img-responsive">

Select `master` from the list of available branches.

<img src="/docs/assets/img/languages/elixir/elixir-select-branch.png" class="img-responsive">

Semaphore will do a brief analysis of the project and suggest some useful commands
to speed up the setup process. However, these commands can be [changed]
(/docs/customizing-build-commands.html) at any time in project settings.

<img src="/docs/assets/img/languages/elixir/elixir-analysis-complete.png" class="img-responsive">

We will leave the suggested commands intact and start our first build.

<img src="/docs/assets/img/languages/elixir/elixir-first-successful-build.png" class="img-responsive">

The project has been successfully integrated with Semaphore, taking full advantage
of [continuous integration](https://semaphoreci.com/community/tutorials/continuous-integration).
