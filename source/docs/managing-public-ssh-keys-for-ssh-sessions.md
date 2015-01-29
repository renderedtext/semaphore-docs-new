---
layout: post
title: Managing public SSH keys for SSH session
category: The Semaphore platform
---

To launch and use an [SSH session](/docs/ssh-access-to-build-environment.html) 
on Semaphore you need to add a public SSH key in your account settings.

If you don’t already have an SSH key, you’ll need to create a public/private key
pair. This key-pair is used for strong cryptography and it uniquely identifies
you when accessing Semaphore. To generate such a key pair type the following in
your shell:

``` sh
ssh-keygen
```

When you create an SSH key pair you will need to copy the public part
of that key into your Semaphore account. The public part of the
key is usually stored in the `~/.ssh` directory and has a suffix `.pub`.

If you have created a key using the above command you should have
a `.ssh/id_rsa.pub` file that contains your public key.

An easy way to display this key is to type the following:

``` sh
cat ~/.ssh/id_rsa.pub
```

### Adding public SSH keys to Semaphore

To get started, open your account setting's Public SSH keys tab and
click to add a new key.

<img src="/docs/assets/img/public-ssh-keys/first-public-ssh-key.png" class="img-responsive">

Enter a name for your key and copy the content of your public SSH key.

<img src="/docs/assets/img/public-ssh-keys/adding-public-ssh-keys.png" class="img-responsive">

After the above steps you should see your public SSH key added to Semaphore.

<img src="/docs/assets/img/public-ssh-keys/added-public-ssh-keys.png" class="img-responsive">
