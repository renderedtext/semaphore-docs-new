---
layout: post
title: Can I use Postgres, MongoDB and Redis on one project?
category: Managing dependencies
---

Yes. Select Postgres as your database in project settings; that will make sure that Semaphore injects a working `database.yml` file.

For Mongo, you’ll need to add build command such as:

```bash
cp config/mongoid.yml.example config/mongoid.yml
```

Default MongoDB configuration file that you use in development will work, no credentials are required.

Redis is running on default port and by default works without any configuration.
