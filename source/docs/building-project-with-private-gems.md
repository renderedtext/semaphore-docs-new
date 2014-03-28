---
layout: post
title: Building a project with private gems
category: Managing dependencies
---

Either use a hosted private gem repository such as [Gemfury](http://www.gemfury.com/), or follow this procedure:

### - Get an OAuth Token from  GitHub

First you will need to get an OAuth Token from GitHub using your own username and "note"

```bash
curl -u 'masonforest' -d '{"scopes":["repo"], "note":"Semaphore CI private gem"}' https://api.github.com/authorizations
```

### - Authenticate bundler to GitHub via OAuth Token

Add this line to your Gemfile replacing "your_token" with the token you got from first step.
In this example we are installing the 'ventana' gem:

```bash
gem 'ventana', git: "https://your_token:x-oauth-basic@github.com/renderedtext/ventana.git"
```

## More secure alternative:

### Storing the OAuth token in an environment variable

For additional security you can store your OAuth token in an environment variable. This way your token is not included in your codebase which is insecure.
However this technique require form you to export OAuth token in your development environment too (Best way is to export it in ~/.zshrc or ~/.bashrc).

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

As of November 2013 Semaphore supports saving and using custom configuration files, including SSH keys. [Follow this guide](/docs/adding-more-ssh-keys.html) to set up an additional SSH key which can give your build or deploy permissions to pull private dependencies.

This option works only for 1 private gem and SSH key. If you have more than one, use one of the methods listed above.
