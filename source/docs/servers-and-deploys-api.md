---
layout: post
title: Servers & deploys
category: API
---

- [Project's servers](#project_servers)
- [Server Status](#server_status)
- [Server History](#server_history)
- [Deploy Information](#deploy_information)
- [Deploy Log](#deploy_log)

## <a name="project_servers" href="#project_servers">Project's servers</a>

```bash
GET /api/v1/projects/:hash_id/servers
```

### Arguments

- `hash_id` of the project

### Response

```json
[
  {
     "id": 9,
     "name": "staging",
     "server_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/9/status?auth_token=:auth_token"
  },
  {
     "id": 11,
     "name": "production",
     "server_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/status?auth_token=:auth_token"
  }
]
```

## <a name="server_status" href="#server_status">Server Status</a>

```bash
GET /api/v1/projects/:hash_id/servers/:id/status
```

### Arguments

- `hash_id` of the project
- `id` of the server

### Response

```json
{
  "server_name": "production",
  "server_url": "https://semaphoreapp.com/projects/1/servers/11",
  "server_status_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/status?auth_token=:auth_token",
  "server_history_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11?auth_token=:auth_token",
  "deployment_method": "capistrano",
  "strategy": "manual",
  "branch_name": null,
  "project_name": "semaphore",
  "number": 27,
  "result": "passed",
  "created_at": "2013-07-23T10:57:42+02:00",
  "updated_at": "2013-07-23T11:00:41+02:00",
  "started_at": "2013-07-23T10:57:49+02:00",
  "finished_at": "2013-07-23T11:00:41+02:00",
  "html_url": "https://semaphoreapp.com/projects/1/servers/11/deploys/27",
  "deploy_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/deploys/27?auth_token=:auth_token",
  "deploy_log_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/deploys/27/log?auth_token=:auth_token",
  "build_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/29803/builds/119?auth_token=:auth_token",
  "build_html_url": "https://semaphoreapp.com/projects/1/branches/29803/builds/119",
  "commit": {
     "id": "222f031528545f2bc8284a4725fe160a0fb443x1",
     "url": "https://github.com/renderedtext/semaphore/commit/222f031528545f2bc8284a4725fe160a0fb443x1",
     "author_name": "Marko Anastasov",
     "author_email": "marko@renderedtext.com",
     "message": "Merge branch 'staging'",
     "timestamp": "2013-07-22T17:52:27+02:00"
   }
}
```

## <a name="server_history" href="#server_history">Server History</a>

```bash
GET /api/v1/projects/:hash_id/servers/:id
```

### Arguments

- `hash_id` of the project
- `id` of the server

Server deploys are returned paginated by 10 per page. A specific page can be requested using the `page` parameter. The pagination information is included in the response header.

### Pagination header

```json
{
  "total_entries": 46,
  "total_pages": 5,
  "per_page": 10,
  "current_page": 1,
  "first_page": true,
  "last_page": false,
  "previous_page": null,
  "next_page": 2
}
```

### Response

```json
{
   "server_name": "production",
   "server_url": "https://semaphoreapp.com/projects/1/servers/11",
   "server_status_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/status?auth_token=:auth_token",
   "server_history_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11?auth_token=:auth_token",
   "deployment_method": "capistrano",
   "strategy": "manual",
   "branch_name": null,
   "project_name": "semaphore",
   "deploys": [
      {
         "project_name": "semaphore",
         "server_name": "production",
         "number": 27,
         "result": "passed",
         "created_at": "2013-07-23T10:57:42+02:00",
         "updated_at": "2013-07-23T11:00:41+02:00",
         "started_at": "2013-07-23T10:57:49+02:00",
         "finished_at": "2013-07-23T11:00:41+02:00",
         "html_url": "https://semaphoreapp.com/projects/1/servers/11/deploys/27",
         "deploy_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/deploys/27?auth_token=:auth_token",
         "deploy_log_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/deploys/27/log?auth_token=:auth_token",
         "build_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/29803/builds/119?auth_token=:auth_token",
         "build_html_url": "https://semaphoreapp.com/projects/1/branches/29803/builds/119",
         "commit": {
            "id": "222f0123418545f21234184a4725fe16asfa125123",
            "url": "https://github.com/renderedtext/semaphore/commit/222f0123418545f21234184a4725fe16asfa125123",
            "author_name": "Marko Anastasov",
            "author_email": "marko@renderedtext.com",
            "message": "Merge branch 'staging'",
            "timestamp": "2013-07-22T17:52:27+02:00"
         }
      },
      {
         "project_name": "semaphore",
         "server_name": "production",
         "number": 26,
         "result": "passed",
         "created_at": "2013-07-23T09:57:42+02:00",
         "updated_at": "2013-07-23T10:00:41+02:00",
         "started_at": "2013-07-23T09:57:49+02:00",
         "finished_at": "2013-07-23T10:00:41+02:00",
         "html_url": "https://semaphoreapp.com/projects/1/servers/11/deploys/27",
         "deploy_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/deploys/27?auth_token=:auth_token",
         "deploy_log_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/deploys/27/log?auth_token=:auth_token",
         "build_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/29803/builds/119?auth_token=:auth_token",
         "build_html_url": "https://semaphoreapp.com/projects/1/branches/29803/builds/119",
         "commit": {
            "id": "222f0123418545f21234184a4725fe16asfa125123",
            "url": "https://github.com/renderedtext/semaphore/commit/222f0123418545f21234184a4725fe16asfa125123",
            "author_name": "Marko Anastasov",
            "author_email": "marko@renderedtext.com",
            "message": "Merge branch 'staging'",
            "timestamp": "2013-07-22T16:52:27+02:00"
         }
      }
   ]
}
```

## <a name="deploy_information" href="#deploy_information">Deploy Information</a>

```bash
GET /api/v1/projects/:hash_id/servers/:id/deploys/:number
```

### Arguments

- `hash_id` of the project
- `id` of the server
- `number` of the deploy

### Response

```json
{
    "project_name": "semaphore",
    "server_name": "production",
    "number": 27,
    "result": "passed",
    "created_at": "2013-07-23T10:57:42+02:00",
    "updated_at": "2013-07-23T11:00:41+02:00",
    "started_at": "2013-07-23T10:57:49+02:00",
    "finished_at": "2013-07-23T11:00:41+02:00",
    "html_url": "https://semaphoreapp.com/projects/1/servers/11/deploys/27",
    "deploy_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/deploys/27?auth_token=:auth_token",
    "deploy_log_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/deploys/27/log?auth_token=:auth_token",
    "build_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/29803/builds/119?auth_token=:auth_token",
    "build_html_url": "https://semaphoreapp.com/projects/1/branches/29803/builds/119",
    "commit": {
        "id": "222f0123418545f21234184a4725fe16asfa125123",
        "url": "https://github.com/renderedtext/semaphore/commit/222f0123418545f21234184a4725fe16asfa125123",
        "author_name": "Marko Anastasov",
        "author_email": "marko@renderedtext.com",
        "message": "Merge branch 'staging'",
        "timestamp": "2013-07-22T17:52:27+02:00"
    }
}
```

## <a name="deploy_log" href="#deploy_log">Deploy Log</a>

```bash
GET /api/v1/projects/:hash_id/servers/:id/deploys/:number/log
```

### Arguments

- `hash_id` of the project
- `id` of the server
- `number` of the deploy

### Response

```json
{
    "threads": [
        {
            "number": 1,
            "commands": [
                {
                    "name": "bundle install --path vendor/bundle",
                    "result": "0",
                    "output": "Here goes long command output",
                    "start_time": "2013-07-23T08:58:38Z",
                    "finish_time": "2013-07-23T08:58:40Z",
                    "duration": "00:02"
                },
                {
                    "name": "bundle exec cap -S revision=$REVISION production deploy:migrations",
                    "result": "0",
                    "output": "Here goes long command output",
                    "start_time": "2013-07-23T08:58:40Z",
                    "finish_time": "2013-07-23T08:59:56Z",
                    "duration": "01:16"
                }
            ]
        }
    ],
    "deploy_info_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/servers/11/deploys/27?auth_token=:auth_token"
}
```
