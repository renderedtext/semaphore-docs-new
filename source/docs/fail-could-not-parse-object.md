---
layout: post
title: "Fail: 'fatal Could not parse object' during bundle install"
category: Build troubleshooting
---

If bundle install output looks like this:

```bash
Fetching gem metadata from http://rubygems.org/.......
Fetching gem metadata from http://rubygems.org/..
Updating git://github.com/some/gem.git
fatal: Could not parse object 'a84dd3407eaf064064cca9650c354cb163384467'.
Git error: command `git reset --hard a84dd3407eaf064064cca9650c354cb163384467` in directory /home/runner/somehash/vendor/bundle/ruby/1.9.1/bundler/gems/gem-a84dd3407eaf has failed.
If this error persists you could try removing the cache directory '/home/runner/somehash/vendor/bundle/ruby/1.9.1/cache/bundler/git/gem-cbe2ee16ed53098079007f06cd77ed0890d0d752'
```

This problem occurs when there have been changes like force-pushes to a git repo which is referenced in a Gemfile.

The solution is is to comment that gem line in Gemfile, run bundle, uncomment it and bundle again. Then the Gemfile.lock will reference a valid git revision.
