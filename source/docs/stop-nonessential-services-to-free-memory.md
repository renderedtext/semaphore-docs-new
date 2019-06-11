---
layout: post
title: Stop non essential services to gain more free memory
category: Adapting Semaphore
---

If your test suite requires more than available free RAM memory, you can gain more memory by adding the following command to the setup of your project:

```bash
for s in apache2 cassandra elasticsearch memcached mongod postgresql sphinxsearch rabbitmq-server; do sudo service $s stop; done
```

This command will stop listed services and free up around 1GB of RAM memory.
