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

```bash
sudo apt-get update
```

### <a name="caching-installations" href="#caching-installations">Caching installations</a>

An improvement over the steps above, is to use `install-package` instead. It's
main purpose is to cache installations from APT. Currently, it supports package
versions, but no `apt-get` options. It can be used as described below, without
using `sudo` or running `apt-get update`. If you're using a third party PPA,
make sure that it's added beforehand.

```bash
install-package dependency-1 dependency-2=0.11.2-1
```

`install-package` supports the following option flags:

```md
--update, -u
  Force updating the package list by running 'apt-get update'. By default
  the update is ran only the first time `install-package` is executed

--skip-update, -s
  Skips running `apt-get update`. Useful when installing packages, which are
  already present in the local package list cache. However, some packages can get
  outdated, so using this option isn't advised.

--update-new, -n
  Runs 'apt-get update' only on newly added PPA lists. The lists should be added
  manually, and 'add-apt-repository' isn't supported yet. This option
  is useful when installing packages from third-party PPAs, as it considerably
  cuts down the installation time.

Example:

  $ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv
  2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5

  $ echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/testing multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list

  $ install-package --update-new mongodb-org

```

If you need help, just [email us](mailto:semaphore@renderedtext.com) with your needs. If not, we’d still love to hear from you – knowing that many people are using a particular dependency generally encourages us to add it to the platform.
