---
layout: post
title: Exporting environment variables
category: Customizing your build
---

Some projects during CI need to have sensitive information that cannot be part of the code repository. Examples include secret tokens and passwords that you only need on Semaphore. One way of handling this kind of information is to store them into an environment variable. You can easily manage such variables on Semaphore using the "Environment Variables" settings, which will make them available during the the build and deploy process.

To get started, open your project settings, "Environment Variables" tab. Click to add a new variable.

<img src="/docs/assets/img/exporting-environment-variables/first-environment-variable.png" class="img-responsive">

For a new variable you need to specify a variable name and value that you want to store. For instance, if you want a variable "SECRET_TOKEN" with a value "123abcde" then your configuration panel should look like this:

<img src="/docs/assets/img/exporting-environment-variables/new-variable.png" class="img-responsive">

For greater security, the content of your variable can be stored as encrypted data. We strongly recommend that you select this option if you are adding sensitive data. Once created, the encrypted variable cannot be edited. The identity of your variable can be determined by the MD5 hash.

When you choose to use encryption, the environment variable's value is stored in the database using an
[asymmetric encryption algorithm](http://en.wikipedia.org/wiki/Public-key_cryptography),
and decrypted right before it gets exported in your build.

<img src="/docs/assets/img/exporting-environment-variables/environment-variable-list.png" class="img-responsive">

Each environment variable is exported before your build starts along with
the [default set of environment variables](/docs/available-environment-variables.html).

Note that you can also simply have `export VAR=foo` in your build commands.

See also: [how to add custom configuration files](/docs/adding-custom-configuration-files.html) to your build.
