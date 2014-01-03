---
layout: post
title: Permission denied from GitHub on bundle install
category: Build troubleshooting
---

Example of output:

```bash
Fetching gem metadata from https://rubygems.org/......
Fetching gem metadata from https://rubygems.org/..
Fetching git@github.com:username/repo.git
Warning: Permanently added 'github.com,192.30.252.130' (RSA) to the list of known hosts.
Permission denied (publickey).
fatal: Could not read from remote repository.
Please make sure you have the correct access rights
and the repository exists.
Git error: command `git clone 'git@github.com:username/repo.git'
"/home/runner/1234567890/vendor/bundle/ruby/1.9.1/cache/bundler/git/repo-7154ad9a69a3675cd199759326aafba479a5fcd3"
--bare --no-hardlinks` in directory
/home/runner/1234567890 has failed.
```

Make sure that your Gemfile is referencing a repository with a public, read-only URL and not with a private SSH URL which requires presence of your personal SSH key.

This is good:

```ruby
gem "rails-settings", :git => "https://github.com/renderedtext/rails-settings.git"
```

This won't work (unless you insert a working SSH key into the build environment, which is not necessary unless it's a [private repository](/docs/how-to-build-project-with-private-gems.html)):

```ruby
gem "rails-settings", :git => "git@github.com:renderedtext/rails-settings.git"
```
