---
category: API v2
layout: post
title: Teams
---

<ol type="i">
  
    <li>List teams in an organization</li>
  
    <li>Get a team</li>
  
    <li>Create a team in an organization</li>
  
    <li>Update a team</li>
  
    <li>Delete a team</li>
  
</ol>


## List teams in an organization

```
GET /orgs/{org_username}/teams
```



### Response


```
HTTP status: 200

[
  {
    "name": "developers",
    "permission": "write",
    "description": "Developers team",
    "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "url": "https://api.semaphoreci.com/v2/teams/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "updated_at": "2017-06-10 16:59:51 +0200",
    "created_at": "2017-06-10 16:59:51 +0200"
  }
]
```



## Get a team

```
GET /teams/{id}
```



### Response


```
HTTP status: 200

{
  "name": "developers",
  "permission": "write",
  "description": "Developers team",
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/teams/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "updated_at": "2017-06-10 16:59:51 +0200",
  "created_at": "2017-06-10 16:59:51 +0200"
}
```



## Create a team in an organization

```
POST /orgs/{org_username}/teams
```


### Request


| Name | Type | Required | Example |
| ---- | ---- | -------- | ------- |
| name | string | true | developers |
| permission | string | true | write |
| description | string | false | Developers team |



### Response


```
HTTP status: 200

{
  "name": "developers",
  "permission": "write",
  "description": "Developers team",
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/teams/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "updated_at": "2017-06-10 16:59:51 +0200",
  "created_at": "2017-06-10 16:59:51 +0200"
}
```



## Update a team

```
PATCH /teams/{id}
```


### Request


| Name | Type | Required | Example |
| ---- | ---- | -------- | ------- |
| name | string | false | developers |
| permission | string | false | write |
| description | string | false | Developers team |



### Response


```
HTTP status: 200

{
  "name": "developers",
  "permission": "write",
  "description": "Developers team",
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "url": "https://api.semaphoreci.com/v2/teams/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "updated_at": "2017-06-10 16:59:51 +0200",
  "created_at": "2017-06-10 16:59:51 +0200"
}
```



## Delete a team

```
DELETE /teams/{id}
```



### Response


```
HTTP status: 204
```



