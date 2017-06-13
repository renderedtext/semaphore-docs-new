---
category: API v2
layout: post
title: Env Vars
---

<ol type="i">
  
    <li>List environment variables connected to a project</li>
  
    <li>List environment variables belonging to a shared configuration</li>
  
    <li>Get an environment variable</li>
  
    <li>Create environment variable within a shared configuration</li>
  
    <li>Update an environment variable</li>
  
    <li>Delete an environment variable</li>
  
    <li>Connect a shared environment variable to a project</li>
  
    <li>Dissconnect a shared environment variable from a project</li>
  
</ol>


## List environment variables connected to a project

```
GET /projects/{project_id}/env_vars
```



### Response


```
HTTP status: 200

[
  {
    "name": "API_TOKEN",
    "content": "8CgLAxXn",
    "encrypted": true,
    "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "url": "https://api.semaphoreci.com/v2/env_vars/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "shared": "true",
    "created_at": "2017-06-10 16:59:51 +0200",
    "updated_at": "2017-06-10 16:59:51 +0200"
  }
]
```



## List environment variables belonging to a shared configuration

```
GET /shared_configs/{shared_config_id}/env_vars
```



### Response


```
HTTP status: 200

[
  {
    "name": "API_TOKEN",
    "content": "8CgLAxXn",
    "encrypted": true,
    "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "url": "https://api.semaphoreci.com/v2/env_vars/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "shared": "true",
    "created_at": "2017-06-10 16:59:51 +0200",
    "updated_at": "2017-06-10 16:59:51 +0200"
  }
]
```



## Get an environment variable

```
GET /env_vars/{id}
```



### Response


```
HTTP status: 200

{
  "name": "API_TOKEN",
  "content": "8CgLAxXn",
  "encrypted": true,
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/env_vars/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "shared": "true",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



## Create environment variable within a shared configuration

```
POST /shared_configs/{shared_config_id}/env_vars
```


### Request


| Name | Type | Required | Example |
| ---- | ---- | -------- | ------- |
| name | string | true | API_TOKEN |
| content | string | true | 8CgLAxXn |
| encrypted | boolean | true | true |



### Response


```
HTTP status: 200

{
  "name": "API_TOKEN",
  "content": "8CgLAxXn",
  "encrypted": true,
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/env_vars/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "shared": "true",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



## Update an environment variable

```
PATCH /env_vars/{id}
```


### Request


| Name | Type | Required | Example |
| ---- | ---- | -------- | ------- |
| name | string | false | API_TOKEN |
| content | string | false | 8CgLAxXn |



### Response


```
HTTP status: 200

{
  "name": "API_TOKEN",
  "content": "8CgLAxXn",
  "encrypted": true,
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/env_vars/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "shared": "true",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



## Delete an environment variable

```
DELETE /env_vars/{id}
```



### Response


```
HTTP status: 204
```



## Connect a shared environment variable to a project

```
POST /projects/{project_id}/env_vars/{env_var_id}
```



### Response


```
HTTP status: 204
```



## Dissconnect a shared environment variable from a project

```
DELETE /projects/{project_id}/env_vars/{env_var_id}
```



### Response


```
HTTP status: 204
```



