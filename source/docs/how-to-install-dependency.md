---
layout: post
title: How to install a dependency?
category: Managing dependencies
---

The Semaphore platform has most of the popular programming languages and databases preinstalled. To learn more about installed dependencies check our [Supported stack](/docs/supported-stack.html) article.

If the dependency you need is not already installed, you can install it with the Ubuntu package manager or using an alternative method such as compiling it from the source, or manually downloading binaries.

To install dependecies using the package manager (`apt-get`) you can use the template command below and add it to your [build settings](/docs/customizing-build-commands.html):

```bash
sudo apt-get install -y your-dependency
```

At the start of your build settings you should have the following:

```
sudo apt-get update
```

If you need help, just [email us](mailto:semaphore@renderedtext.com) with your needs. If not, we’d still love to hear from you – knowing that many people are using a particular dependency generally encourages us to add it to the platform.
