---
layout: post
title: Building a project with private gems
category: Managing dependencies
tags:
  - ruby
---

Either use a hosted private gem repository such as [Gemfury](http://www.gemfury.com/), or follow this procedure:

### - Get an OAuth Token from  GitHub

First you will need to get an OAuth Token from GitHub using your own username and "note"

```bash
curl -u 'masonforest' -d '{"scopes":["repo"], "note":"Semaphore CI private gem"}' https://api.github.com/authorizations
```

### - Authenticate bundler to GitHub via OAuth Token

Add this line to your Gemfile replacing "your_token" with the token you got
from first step.  In this example we are installing the 'ventana' gem:

```bash
gem 'ventana', git: "https://your_token:x-oauth-basic@github.com/renderedtext/ventana.git"
```

## More secure alternative:

### Storing the OAuth token in an environment variable

For additional security you can store your OAuth token in an environment
variable. This way your token is not included in your codebase which is
insecure.  However this technique require form you to export OAuth token in
your development environment too (Best way is to export it in ~/.zshrc or
~/.bashrc).

Change the line in your Gemfile to

```bash
gem 'ventana', git: "https://#{ENV['GITHUB_TOKEN']}:x-oauth-basic@github.com/thoughtbot/ventana.git"
```

Then export token on Semaphore using the token you got from above:

```bash
export GITHUB_TOKEN=your_token
```

Now bundle localy and you are ready to build on Semaphore!

## Third alternative: additional SSH key

As of November 2013 Semaphore supports saving and using configuration files,
including SSH keys. [Follow this guide](/docs/adding-more-ssh-keys.html) to set
up an additional SSH key which can give your build or deploy permissions to
pull private dependencies.

Since the Git client uses only the first key from the `ssh-agent` we'd like to
suggest using one of the methods listed above.

## Create a machine user on Github

If project's dependencies are hosted on the Github, you can enable Semaphore environment to fetch repositories with these steps:

1. Create a [machine user](https://developer.github.com/v3/guides/managing-deploy-keys/#machine-users) with access to repositories
2. Create new SSH key pair for the purpose of automation
3. Add private SSH key to the project as a [configuration file](/docs/adding-more-ssh-keys.html) in the project settings
4. Add the public SSH key to the user settings for the `machine user`

# Download a private gem in a project - **practical example**

If your project uses a gem that is coming from private repository which requires authentication, you can clone repositories from within Semaphore and the SSH protocol should be used in Git. You may set this up by:

1. Changing the URLs in .gitsubmodules to SSH.
For example, when private submodule is hosted on Github, URL should be similar to the following:

```bash
url = git@github.com:<repo_owner>/<repo>.git
```

2. Creating a machine user on Github and allowing it to access your repositories.

2.1. Generate a new SSH key-pair for the machine user (public part goes to Github),
2.2. Add the private part to Semaphore Classic as a configuration file.
