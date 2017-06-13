---
category: API v2
loyout: post
title: Config Files
---

<ol type="i">
  
    <li>List config files connected to a project</li>
  
    <li>List config files belonging to a shared configuration</li>
  
    <li>Get a config file</li>
  
    <li>Create a config file within a shared configuration</li>
  
    <li>Update a config file</li>
  
    <li>Delete a config file</li>
  
    <li>Connect a shared config file to a project</li>
  
    <li>Dissconnect a shared config file from a project</li>
  
</ol>


## List config files connected to a project

```
GET /projects/{project_id}/config_files
```



### Response


```
HTTP status: 200

[
  {
    "path": ".credentials",
    "content": "password: ec2c9f6f64b5",
    "encrypted": true,
    "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "url": "https://api.semaphoreci.com/v2/config_files/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "shared": "true",
    "created_at": "2017-06-10 16:59:51 +0200",
    "updated_at": "2017-06-10 16:59:51 +0200"
  }
]
```



## List config files belonging to a shared configuration

```
GET /shared_configs/{shared_config_id}/config_files
```



### Response


```
HTTP status: 200

[
  {
    "path": ".credentials",
    "content": "password: ec2c9f6f64b5",
    "encrypted": true,
    "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "url": "https://api.semaphoreci.com/v2/config_files/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "shared": "true",
    "created_at": "2017-06-10 16:59:51 +0200",
    "updated_at": "2017-06-10 16:59:51 +0200"
  }
]
```



## Get a config file

```
GET /config_files/{id}
```



### Response


```
HTTP status: 200

{
  "path": ".credentials",
  "content": "password: ec2c9f6f64b5",
  "encrypted": true,
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/config_files/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "shared": "true",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



## Create a config file within a shared configuration

```
POST /shared_configs/{shared_config_id}/config_files
```


### Request


| Name | Type | Required | Example |
| ---- | ---- | -------- | ------- |
| path | string | true | .credentials |
| content | string | true | password: ec2c9f6f64b5 |
| encrypted | boolean | true | true |



### Response


```
HTTP status: 200

{
  "path": ".credentials",
  "content": "password: ec2c9f6f64b5",
  "encrypted": true,
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/config_files/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "shared": "true",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



## Update a config file

```
PATCH /config_files/{id}
```


### Request


| Name | Type | Required | Example |
| ---- | ---- | -------- | ------- |
| path | string | false | .credentials |
| content | string | false | password: ec2c9f6f64b5 |



### Response


```
HTTP status: 200

{
  "path": ".credentials",
  "content": "password: ec2c9f6f64b5",
  "encrypted": true,
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/config_files/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "shared": "true",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



## Delete a config file

```
DELETE /config_files/{id}
```



### Response


```
HTTP status: 204
```



## Connect a shared config file to a project

```
POST /projects/{project_id}/config_files/{config_file_id}
```



### Response


```
HTTP status: 204
```



## Dissconnect a shared config file from a project

```
DELETE /projects/{project_id}/config_files/{config_file_id}
```



### Response


```
HTTP status: 204
```



