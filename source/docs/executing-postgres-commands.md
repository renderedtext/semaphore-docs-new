---
layout: post
title: Executing Postgres commands
category: Customizing your build
---

Add a build command which looks something like:

```bash
psql -c "anything" -d $DATABASE_NAME_TEST -P pager
```
