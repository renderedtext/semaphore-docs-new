---
layout: post
title: How to make an HTTP POST request from Semaphore Classic build to a URL?
category: API
---

If you’d like to make an HTTP POST request from Semaphore Classic build to a
URL, it is possible to do by crafting an HTTP POST request with curl command:

```
curl -i -X POST -H 'Content-Type: application/json' -d '{"param_1_name": "param_1_value", "param_2_name": "param_2_val", "param_using_env_var_1": "'"$ENV_VAR_1"'", "param_using_env_var_2": "'"$ENV_VAR_2"'"}' https://semaphoreci.com/api/v1/projects/
```

The parameters can be added or removed depending on your preferences.
