---
layout: post
title: How to install specific Ruby version?
category: Managing dependencies
---

In case your application requires specific Ruby version which is not available by default in Semaphore VM you can install it via rbenv. It's simple. You would only need to add few lines to your build commands like in example below:

```bash
rbenv install 2.1.0-preview1
rbenv local 2.1.0-preview1
gem install bundler --no-ri --no-rdoc
# followed by your build commands
```

You can find the list of available Ruby versions on our [supported application stack](/supported-stack) page.
