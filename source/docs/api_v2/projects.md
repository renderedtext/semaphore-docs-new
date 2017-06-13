---
category: API v2
layout: post
title: Projects
---

<ol type="i">
  
    <li>List projects in an organization</li>
  
</ol>


## List projects in an organization

```
GET /orgs/{org_username}/projects
```



### Response


```
HTTP status: 200

[
  {
    "id": "86e78b7e-2f9c-45a7-9939-ec2c9f6f64b5",
    "name": "elixir-lang",
    "updated_at": "2017-06-10 16:59:51 +0200",
    "created_at": "2017-06-10 16:59:51 +0200"
  }
]
```



