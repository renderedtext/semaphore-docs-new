---
layout: post
title: PostGIS
category: Databases
---

Semaphore doesn't provide PostGIS (spatial and geographic objects for PostgreSQL) out of the box. PostGIS can be installed with
a few [build setup commands](/docs/customizing-build-commands.html):

```bash
echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" | sudo tee -a /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-9.3-postgis-2.1 postgresql-9.3-postgis-2.1-scripts
```
