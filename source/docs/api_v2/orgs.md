# Orgs

<ol type="i">
  
    <li>List your organizations</li>
  
    <li>Get an organization</li>
  
</ol>


## List your organizations

```
GET /orgs
```



### Response


```
HTTP status: 200

[
  {
    "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "name": "Rendered Text",
    "url": "https://api.semaphoreci.com/v2/teams/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "username": "renderedtext",
    "created_at": "2017-06-10 16:59:51 +0200",
    "updated_at": "2017-06-10 16:59:51 +0200"
  }
]
```



## Get an organization

```
GET /orgs/{username}
```



### Response


```
HTTP status: 200

{
  "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "name": "Rendered Text",
  "url": "https://api.semaphoreci.com/v2/teams/86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
  "username": "renderedtext",
  "created_at": "2017-06-10 16:59:51 +0200",
  "updated_at": "2017-06-10 16:59:51 +0200"
}
```



