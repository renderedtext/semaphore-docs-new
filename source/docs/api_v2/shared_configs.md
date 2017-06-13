# Shared Configs

<ol type="i">
  
    <li>List shared configurations in an organization</li>
  
    <li>List shared configurations in a team</li>
  
    <li>List shared configurations attached to a project</li>
  
    <li>Get a shared configuration</li>
  
    <li>Create shared configuration in an organization</li>
  
    <li>Update a shared configuration</li>
  
    <li>Delete a shared configuration</li>
  
    <li>Add a shared configuration to a team</li>
  
    <li>Attach a shared configuration to a project</li>
  
    <li>Remove shared configuration from a team</li>
  
    <li>Dettach a shared configuration from a project</li>
  
</ol>


## List shared configurations in an organization

```
GET /orgs/{org_username}/shared_configs
```



### Response


```
HTTP status: 200

[
  {
    "name": "AWS Tokens",
    "description": "AWS tokens for deployment",
    "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "url": "https://api.semaphoreci.com/v2/shared_configs/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "created_at": "2017-06-10 16:59:51 +0200",
    "updated_at": "2017-06-10 16:59:51 +0200"
  }
]
```



## List shared configurations in a team

```
GET /teams/{team_id}/shared_configs
```



### Response


```
HTTP status: 200

[
  {
    "name": "AWS Tokens",
    "description": "AWS tokens for deployment",
    "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "url": "https://api.semaphoreci.com/v2/shared_configs/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "created_at": "2017-06-10 16:59:51 +0200",
    "updated_at": "2017-06-10 16:59:51 +0200"
  }
]
```



## List shared configurations attached to a project

```
GET /projects/{project_id}/shared_configs
```



### Response


```
HTTP status: 200

[
  {
    "name": "AWS Tokens",
    "description": "AWS tokens for deployment",
    "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "url": "https://api.semaphoreci.com/v2/shared_configs/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "created_at": "2017-06-10 16:59:51 +0200",
    "updated_at": "2017-06-10 16:59:51 +0200"
  }
]
```



## Get a shared configuration

```
GET /shared_configs/{id}
```



### Response


```
HTTP status: 200

{
  "name": "AWS Tokens",
  "description": "AWS tokens for deployment",
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/shared_configs/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



## Create shared configuration in an organization

```
POST /orgs/{org_username}/shared_configs
```


### Request


| Name | Type | Required | Example |
| ---- | ---- | -------- | ------- |
| name | string | true | AWS Tokens |
| description | string | false | AWS tokens for deployment |



### Response


```
HTTP status: 200

{
  "name": "AWS Tokens",
  "description": "AWS tokens for deployment",
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/shared_configs/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



## Update a shared configuration

```
PATCH /shared_configs/{id}
```


### Request


| Name | Type | Required | Example |
| ---- | ---- | -------- | ------- |
| name | string | false | AWS Tokens |
| description | string | false | AWS tokens for deployment |



### Response


```
HTTP status: 200

{
  "name": "AWS Tokens",
  "description": "AWS tokens for deployment",
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/shared_configs/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



## Delete a shared configuration

```
DELETE /shared_configs/{id}
```



### Response


```
HTTP status: 204
```



## Add a shared configuration to a team

```
POST /teams/{team_id}/shared_configs/{shared_config_id}
```



### Response


```
HTTP status: 204
```



## Attach a shared configuration to a project

```
POST /projects/{project_id}/shared_configs/{shared_config_id}
```



### Response


```
HTTP status: 200

{
  "name": "AWS Tokens",
  "description": "AWS tokens for deployment",
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/shared_configs/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



## Remove shared configuration from a team

```
DELETE /teams/{team_id}/shared_configs/{shared_config_id}
```



### Response


```
HTTP status: 204
```



## Dettach a shared configuration from a project

```
DELETE /projects/{project_id}/shared_configs/{shared_config_id}
```



### Response


```
HTTP status: 204
```



