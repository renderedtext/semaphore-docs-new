---
layout: post
title: Webhooks
category: API
---

- [List hooks](#list_hooks)
- [Create a hook](#create_hook)
- [Edit a hook](#edit_hook)
- [Delete a hook](#delete_hook)


## <a name="list_hooks" href="#list_hooks">Project's webhooks</a>

```bash
GET /api/v1/projects/:hash_id/hooks
```

### Arguments

- `hash_id` of the project

### Response

```json
[
  {
    "id": 256,
    "url: "http://semaphoreflag.herokuapp.com/qH36J7zzMAxmF72f",
    "hook_type: "post_build"
  },
  {
    "id": 257,
    "url": "http://semaphoreflag.herokuapp.com/qH36sdffgae2f",
    "hook_type": "post_deploy"
  }
]
```


## <a name="create_hook" href="#create_hook">Create a hook</a>

```bash
POST /api/v1/projects/:hash_id/hooks
```

### Arguments

- `hash_id` of the project


### Body

```json
{
  "url": "http://google.com",
  "hook_type": "all"
}
```

_Required:_

- `url` for webhook - type string
- `hook_type` trigger events - type string ("post\_build", "post\_deploy" or "all")

### Response

```json
{
  "id": 266,
  "url": "http://google.com",
  "hook_type": "all"
}
```


## <a name="edit_hook" href="#edit_hook">Edit a hook</a>

```bash
PUT /api/v1/projects/:hash_id/hooks/:webhook_id
```

### Arguments

- `hash_id` of the project
- `webhook_id` id of webhook

### Body

```json
{
  "url": "http://yahoo.com",
  "hook_type": "all"
}
```

_Required:_

- `url` for webhook - type string
- `hook_type` trigger events - type string ("post\_build", "post\_deploy" or "all")

### Response

```json
{
  "id": 266,
  "url": "http://yahoo.com",
  "hook_type": "all"
}
```


## <a name="delete_hook" href="#delete_hook">Delete a hook</a>

```bash
DELETE /api/v1/projects/:hash_id/hooks/:webhook_id
```

### Arguments

- `hash_id` of the project
- `webhook_id` id of webhook

### Response

```json
Status: 204 No Content
```
