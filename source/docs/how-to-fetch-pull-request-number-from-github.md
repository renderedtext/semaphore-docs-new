---
layout: post
title: How to fetch the pull request number from Github repository?
category: Adapting Semaphore
---

Semaphore starts a [build after a pull request](/docs/building-pull-requests.html)
has been opened between the main and a fork of the repository.
Every time a new pull request is opened from a fork, Semaphore creates a new branch
whose name matches the pull request title and number (e.g. `pull-request-7`).
In this case, an [environment variable](/docs/available-environment-variables.html)
`PULL_REQUEST_NUMBER` is set.

Since Semaphore automatically builds branches that are created
within a repository, it doesn't support building pull requests that are opened
within the same repository. In this case, variable `PULL_REQUEST_NUMBER` is not set.

If your development process includes the pull request number
for builds within the same repository as well,
the following steps will help you to fetch it.
This way, you can set the `PULL_REQUEST_NUMBER` in the build environment.

Every [Semaphore environment](/docs/supported-stack.html) includes Ruby and
for this purpose we'll use the [Octokit gem](https://github.com/octokit/octokit.rb).

### Adding Github OAuth token to your Semaphore project

[Create environment variable](/docs/exporting-environment-variables.html)
`GITHUB_TOKEN` in the project settings. Its value should be set to the generated token
on Github (Settings > Developer settings > Personal access tokens).
User token has to have the "repo" access.

__Note:__
Once the token is in place,
every Semaphore environment will have [access to available repositories](https://developer.github.com/apps/building-oauth-apps/scopes-for-oauth-apps/).
Creating a [`machine user`](https://developer.github.com/v3/guides/managing-deploy-keys/#machine-users)
for Semaphore on Github, will let you choose accessible repositories.

### Adding a Ruby script to your project

This can be done by creating a [configuration file](/docs/adding-configuration-files.html)
in the project settings on Semaphore.
After you've set its path (e.g. `/home/runner/my-project/pull_request_number.rb`),
the script should include the following lines:

```ruby
#!/bin/env ruby

require 'octokit'

c = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'], :auto_paginate => true)
prs = c.pull_requests(ENV['SEMAPHORE_REPO_SLUG'], :state => "open")
current_pr = prs.select {|pr| pr[:head][:ref] == ENV['BRANCH_NAME']}

pr_value = current_pr.first[:number].to_s unless current_pr.nil?

puts pr_value
```

### Exporting the `PULL_REQUEST_NUMBER` variable

Now, environment variables can be set by adding these commands
to the setup of the build on Semaphore:

```bash
gem install octokit --no-ri --no-rdoc
export PULL_REQUEST_NUMBER=$(ruby pull_request_number.rb)
```

And we're done!
