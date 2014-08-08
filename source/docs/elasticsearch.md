---
layout: post
title: ElasticSearch Support
category: The Semaphore platform
on_homepage: false
---

[ElasticSearch](http://www.elasticsearch.org) is an open source, distributed,
real-time search and analytics engine. Semaphore environment includes
ElasticSearch preinstalled using the
[official Debian package](http://www.elasticsearch.org/download) with the
following additions to `/etc/elasticsearch/elasticsearch.yml`:

```yaml
index.number_of_shards: 1
index.number_of_replicas: 0
```

The `elasticsearch` service is configured to run automatically.
