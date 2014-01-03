---
layout: post
title: Adding custom configuration files
category: Customizing your build
---

Some projects during CI need files that cannot be part of the code repository. Examples include configuration files that contain sensitive data, YAML files that you need only on Semaphore and so on. You can easily manage such files on Semaphore using the "Configuration Files", which will make them available during the the build and deploy process.

To get started, open your project settings, "Configuration Files" tab. Click to add a new file.

For a new file you need to specify a target file path. For instance, if you have a project "semaphore" and you want to add a new file `s3.yml` to your project's `config` directory, your file path should look like the one on the screenshot below:

<img src="/docs/assets/img/how-to-securely-add-custom-file/new-custom-file.png" width="600">

Content of the configuration file can be entered in the text area below.

For greater security, the content of your files can be stored as encrypted. We strongly recommend that you select this option if you are adding sensitive data such as SSH keys. Once created, encrypted file cannot be edited. The identity of your file can be determined by the MD5 hash.

<img src="/docs/assets/img/how-to-securely-add-custom-file/custom-file-list.png" width="600">

See also: [how to add another SSH key](/docs/how-to-add-another-ssh-key.html) to your build.
