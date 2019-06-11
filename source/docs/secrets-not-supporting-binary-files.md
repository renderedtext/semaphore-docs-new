---
layout: post
title: Secrets not supporting binary files
category: Adapting Semaphore
---

If you wish to add a binary file to Semaphore Classic secrets or configuration
files, you may use _base64_ command to encode the binary file to ASCII text and
then store it as a secret or configuration file on Semaphore. In your builds,
the secret can be decoded back to a binary file and used in the project.

**Note:** The example below is using `sem` CLI command, but the logic is the
same if the Semaphore Classic web application is used: output of _base64_ command
is an ASCII text, and as such can be pasted into a secret or config
file contents entry box.

- To encode and add "random_seed" file as a secret to Semaphore, you may use
the following:

```
base64 gnupg-for-semaphore/random_seed | tee gnupg-for-semaphore/random_seed.b64
sem secrets:files:add confluent/gpg --local-path gnupg-for-semaphore/random_seed.b64 --path-on-semaphore .gnupg/random_seed.b64 --trace
```

First command will encode "random_seed" binary file to a Base64 encoded text
file named "random_seed.b64". This text file can be added as a secret to
Semaphore Classic using second command.

- To decode the file back to binary form, _base64_ command is used again but with
a _-d_ switch. This can be added to the setup of your project:

```
base64 -d ~/.gnupg/random_seed.b64 | tee ~/.gnupg/random_seed
```

After decoding the file back to binary form, it may be used without any
restrictions.
