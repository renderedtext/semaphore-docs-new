---
layout: post
title: Custom config.js
category: JavaScript
---

If you select PostgreSQL or MySQL as database for a project, Semaphore will
populate `DATABASE_USERNAME` and `DATABASE_PASSWORD`, with working credentials.

You can create a custom `config.js` using [configuration
files](/docs/adding-configuration-files.html) and [environment
variables](/docs/available-environment-variables.html).

An example configuration file at `project_name/config/config.js` path
might look like this:

```javascript
// config/config.js

module.exports = {
  postgres: {
    database: process.env.DATABASE_NAME_TEST,
    username: process.env.DATABASE_USERNAME,
    password: process.env.DATABASE_PASSWORD
  },
}
```

You can use credentials in `config.js` to instantiate
[Sequelize](https://github.com/sequelize/sequelize):

```javascript
var Sequelize = require('sequelize')
  , config = require(__dirname + "/../config/config")

var sequelize = new Sequelize(config.postgres.database,
config.postgres.username, config.postgres.password, {
  dialect:  'postgres',
  protocol: 'postgres'
})
```
