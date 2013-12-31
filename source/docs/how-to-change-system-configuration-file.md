---
layout: post
title: How can I change /etc/hosts or another system configuration file?
category: Customizing your build
---

If it’s short, this will do:

```bash
sudo sh -c "echo 'yourchange' >> /etc/hosts"
```

If it’s longer, we recommend saving your content in a private gist and then downloading via raw URL:

```bash
sudo sh -c "curl https://raw.github.com/gist/raw_url >> /etc/hosts"
```
