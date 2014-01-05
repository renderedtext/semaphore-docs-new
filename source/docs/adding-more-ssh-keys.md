---
layout: post
title: Adding more SSH keys
category: Customizing your build
---

Semaphore automatically sets up a deploy key needed for CI, and asks you for another deploy key when setting up deployment with Capistrano. However, some projects require additional SSH keys. Some use cases include:

- Deploying to multiple machines.
- Pulling private gems or submodules (note that [this is doable with OAuth tokens](/docs/building-project-with-private-gems.html) too).
- Being able to tag releases with Git.

For all SSH keys you add Semaphore will automatically:

1. Create a file with the name you choose.
2. Run `chmod 600 ~/.ssh/ssh_key_name` to make the key usable by OpenSSH.
3. Run `ssh-agent add ~/.ssh/ssh_key_name`.

Here's how you can do that. Open your project settings, "Configuration Files" tab. Click to add a new file.

<img src="/docs/assets/img/how-to-add-another-ssh-key/blank-form.png" class="img-responsive">

Name your new file `.ssh/custom_id_rsa`.

Check the "Encrypt file" box. This will tell Semaphore to use asymmetric encryption to store and use the content of this file.

Paste the content of your private SSH key. This key should be passwordless, to avoid a blocking prompt for a password during a build or deploy. We recommend that you generate and use this key only on Semaphore.

This what the form would look like at this point:

<img src="/docs/assets/img/how-to-add-another-ssh-key/adding-ssh-key.png" class="img-responsive">

Finally, click "Create File" to save it.

Now, before every build or deploy, Semaphore will create a file called `~/.ssh/custom_id_rsa` and add it to ssh-agent.
