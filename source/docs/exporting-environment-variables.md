---
layout: post
title: Exporting environment variables
category: Customizing your build
---

Some projects during CI need access to sensitive information that cannot be
part of the code repository. Examples include secret tokens and passwords that
you only need on Semaphore.

One way of handling this kind of information is to store them into an
environment variable. You can easily manage such variables on Semaphore using
the "Environment Variables" settings, which will make them available during the
the build and deploy process.

### Adding a new environment variable

To get started, open your project settings, "Environment Variables" tab. Click
on "Add an environment variable" to open a form.

For each variable you need to specify its' name and value (content). For
instance, you would enter "SECRET_TOKEN" as name and "123abcde" as content.

Each environment variable is exported before your build starts along with
the [default set of environment variables](/docs/available-environment-variables.html).

Note that you can also simply have `export VAR=foo` in your build commands.

### Encrypting content of environment variables

For greater security, the content of your variable can be stored as encrypted
data. We strongly recommend that you select this option if you are adding
sensitive data. Once created, the encrypted variable cannot be edited. The
identity of your variable can be determined by the MD5 hash.

When you choose to use encryption, the environment variable's value is stored
in a Semaphore database using an
[asymmetric encryption algorithm](http://en.wikipedia.org/wiki/Public-key_cryptography),
and decrypted right before it gets exported in your build or deploy.

### Adding an environment variable from a secret

You can also include environment variables from a secret into your project.
Secrets help you share common environment variables between your organization
teams and projects. Check out detailed explanation on [what are secrets](/docs/secrets.html)
and how to [add an environment variable to a secret](/docs/secrets.html#adding-an-environment-variable-to-the-secret).

### Limitations

Modifying `PATH` is not supported and will result in build failure.

See also: [how to add configuration files](/docs/adding-custom-configuration-files.html) to your build.
