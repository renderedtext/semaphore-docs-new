---
layout: post
title: Branches & builds
category: API
---

- Project's Branches
- Branch Status
- Branch History
- Build Information
- Build Log
- Rebuild Last Revision

<p class="alert alert-warning">
All API access is over HTTPS. Every method requires the user to provide his authentication token via <strong>auth_token</strong> parameter. To see your authentication token and project hash id, open a project’s settings, then find the “API” tab.
</p>

### Project's branches

```bash
GET /api/v1/projects/:hash_id/branches
```

#### Arguments

- `hash_id` of the project

#### Response

```json
[
   {
      "id": 1324,
      "name": "new-build-page",
      "branch_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/1324/status?auth_token=:auth_token"
   },
   {
      "id": 1120,
      "name": "development",
      "branch_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/1120/status?auth_token=:auth_token"
   },
   {
      "id": 987,
      "name": "branches_api",
      "branch_url": "https://semaphoreapp.com/api/v1/projects/:hash_id/987/status?auth_token=:auth_token"
   }
]
```

### Branch Status

```bash
GET /api/v1/projects/:hash_id/:id/status
```

#### Arguments

- `hash_id` of the project
- `id` of the branch

#### Response

```json
{
   "branch_name": "gem_updates",
   "branch_url": "https://semaphoreapp.com/projects/44/branches/50",
   "branch_status_url": "https://semaphoreapp.com/api/v1/projects/649e584dc507ca4b73e1374d3125ef0b567a949c/89/status?auth_token=Yds3w6o26FLfJTnVK2y9",
   "branch_history_url": "https://semaphoreapp.com/api/v1/projects/649e584dc507ca4b73e1374d3125ef0b567a949c/89?auth_token=Yds3w6o26FLfJTnVK2y9",
   "project_name": "base-app",
   "build_url": "https://semaphoreapp.com/projects/44/branches/50/builds/15",
   "build_info_url": "https://semaphoreapp.com/api/v1/projects/649e584dc507ca4b73e1374d3125ef0b567a949c/89/builds/1?auth_token=Yds3w6o26FLfJTnVK2y9",
   "build_number": 15,
   "result": "passed",
   "started_at": "2012-07-09T15:23:53Z",
   "finished_at": "2012-07-09T15:30:16Z",
   "commit": {
      "id": "dc395381e650f3bac18457909880829fc20e34ba",
      "url": "https://github.com/renderedtext/base-app/commit/dc395381e650f3bac18457909880829fc20e34ba",
      "author_name": "Vladimir Saric",
      "author_email": "vladimir@renderedtext.com",
      "message": "Update 'shoulda' gem.",
      "timestamp": "2012-07-04T18:14:08Z"
   }
}
```


### Branch History

```bash
GET /api/v1/projects/:hash_id/:id
```

#### Arguments

- `hash_id` of the project
- `id` of the branch

Branch builds are returned paginated by 10 per page. A specific page can be requested using the `page` parameter. The pagination information is included in the response header.

#### Pagination header

```json
Pagination: {
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

#### Response

```json
{
   "branch_name": "gem_updates",
   "branch_url": "https://semaphoreapp.com/projects/44/branches/50",
   "branch_status_url": "https://semaphoreapp.com/api/v1/projects/649e584dc507ca4b73e1374d3125ef0b567a949c/89/status?auth_token=Yds3w6o26FLfJTnVK2y9",
   "branch_history_url": "https://semaphoreapp.com/api/v1/projects/649e584dc507ca4b73e1374d3125ef0b567a949c/89?auth_token=Yds3w6o26FLfJTnVK2y9",
   "project_name": "base-app",
   "builds": [
      {
         "build_url": "https://semaphoreapp.com/projects/57/branches/80/builds/46",
         "build_info_url": "https://semaphoreapp.com/api/v1/projects/649e584dc507ca4b73e1374d3125ef0b567a949c/80/builds/1?auth_token=Yds3w6o26FLfJTnVK2y9",
         "build_number": 46,
         "result": "failed",
         "started_at": "2012-10-02T15:01:41Z",
         "finished_at": "2012-10-02T15:03:53Z",
         "commit": {
            "id": "a31d32d5de89613369f934eb7d30fbeb08883334",
            "url": "https://github.com/renderedtext/base-app/commit/a31d32d5de89613369f934eb7d30fbeb08883334",
            "author_name": "Vladimir Saric",
            "author_email": "vladimir@renderedtext.com",
            "message": "Update 'shoulda' gem.",
            "timestamp": "2012-10-02T07:00:14Z"
         }
      },
      {
         "build_url": "https://semaphoreapp.com/projects/57/branches/80/builds/45",
         "build_info_url": "https://semaphoreapp.com/api/v1/projects/649e584dc507ca4b73e1374d3125ef0b567a949c/80/builds/1?auth_token=Yds3w6o26FLfJTnVK2y9",
         "build_number": 45,
         "result": "passed",
         "started_at": "2012-10-02T14:47:06Z",
         "finished_at": "2012-10-02T14:51:35Z",
         "commit": {
            "id": "73fce130ad23f265add5d55ee1da1c23b38f85a4",
            "url": "https://github.com/renderedtext/base-app/commit/73fce130ad23f265add5d55ee1da1c23b38f85a4",
            "author_name": "Marko Anastasov",
            "author_email": "marko@renderedtext.com",
            "message": "Update 'factory_girl_rails' gem and use new short FactoryGirl syntax.",
            "timestamp": "2012-10-02T07:00:14Z"
         }
      }
   ]
}
```

### Build Information

```bash
GET /api/v1/projects/:hash_id/:id/builds/:number
```

#### Arguments

- `hash_id` of the project
- `id` of the branch
- `number` of the build

#### Response

```json
{
  "commits": [
    {
      "id": "47b51ec00ce04dd78fdefe65428e4216580ce89a",
      "url": "https://github.com/renderedtext/base-app/commit/47b51ec00ce04dd78fdefe65428e4216580ce89a",
      "author_name": "Marko Anastasov",
      "author_email": "marko@renderedtext.com",
      "message": "Update cucumber and related stuff.",
      "timestamp": "2013-03-18T09:59:29Z"
    }
  ],
  "project_name": "base-app",
  "branch_name": "master",
  "number": 1,
  "result": "passed",
  "created_at": "2013-03-18T10:40:13Z",
  "updated_at": "2013-03-18T10:51:27Z",
  "started_at": "2013-03-18T10:40:20Z",
  "finished_at": "2013-03-18T10:51:26Z",
  "html_url": "https://semaphoreapp.com/projects/653/branches/4204/builds/26"
}
```

### Build Log

```bash
GET /api/v1/projects/:hash_id/:id/builds/:number/log
```

#### Arguments

- `hash_id` of the project
- `id` of the branch
- `number` of the build

#### Response

```json
{
  "threads": [
    {
      "number": 1,
      "commands": [
        {
          "name": "bundle install --deployment --path vendor/bundle",
          "result": "0",
          "output": "Fetching source index from http://rubygems.org/ Installing rake (10.0.3) Installing i18n (0.6.1) Installing multi_json (1.6.1) Installing activesupport (3.2.11) Installing builder (3.0.4) Installing activemodel (3.2.11) Installing erubis (2.7.0) Installing journey (1.0.4) Installing rack (1.4.5) Installing rack-cache (1.2) Installing rack-test (0.6.2) Installing hike (1.2.1) Installing tilt (1.3.3) Installing sprockets (2.2.2) Installing actionpack (3.2.11) Installing mime-types (1.21) Installing polyglot (0.3.3) Installing treetop (1.4.12) Installing mail (2.4.4) Installing actionmailer (3.2.11) Installing arel (3.0.2) Installing tzinfo (0.3.35) Installing activerecord (3.2.11) Installing activeresource (3.2.11) Installing addressable (2.3.3) Installing kaminari (0.14.1) Installing polyamorous (0.5.0) Installing meta_search (1.1.3) Using bundler (1.3.0) Installing rack-ssl (1.3.2) Installing json (1.7.7)",
          "start_time": "2013-03-12T09:24:30Z",
          "finish_time": "2013-03-12T09:24:37Z",
          "duration": "00:45"
        },
        {
          "name": "gem --version",
          "result": "0",
          "output": "1.8.23",
          "start_time": "2013-03-12T09:25:30Z",
          "finish_time": "2013-03-12T09:25:37Z",
          "duration": "00:00"
        }
      ]
    },
    {
      "number": 2,
      "commands": [
        {
          "name": "bundle exec rake db:test:prepare",
          "result": "0",
          "output": "",
          "start_time": "2013-03-12T09:24:37Z",
          "finish_time": "2013-03-12T09:24:44Z",
          "duration": "00:07"
        }
      ]
    }
  ],
  "build_info_url": "https://semaphoreapp.com/api/v1/projects/3f1004b8343faabda63d441734526c854380ab89/85/builds/1?auth_token=Yds3w6o26FLfJTnVK2y9"
}
```

### Rebuild Last Revision

```bash
POST /api/v1/projects/:project_hash_id/:branch_id/build
```

#### Arguments

- `project_hash_id` project hash id
- `branch_id` branch id

#### Response

```json
{
    "commits": [
        {
            "id": "ee89ebaaaeasdaasdasdqwewlweqlqwleqlwe",
            "url": "https://github.com/renderedtext/semaphore/commit/dasadsdasadsdasadsdsaasdasdasd",
            "author_name": "Rastko Jokic",
            "author_email": "rastko@renderedtext.com",
            "message": "Add cucumber_in_groups",
            "timestamp": "2013-12-25T11:57:44+01:00"
        },
        {
            "id": "2a6e8df4llllll11427e1asdasl97506ffac15",
            "url": "https://github.com/renderedtext/semaphore/commit/2a6e8dasddasdsasadaf69753d5d06ffac15",
            "author_name": "Marko Anastasov",
            "author_email": "marko@renderedtext.com",
            "message": "Merge pull request #410 from renderedtext/rj/cucumber-groups\n\nAdd cucumber_in_groups",
            "timestamp": "2013-12-25T12:31:07+01:00"
        }
    ],
    "project_name": "semaphore",
    "branch_name": "development",
    "number": 1,
    "result": null,
    "created_at": "2013-12-25T14:56:43+01:00",
    "updated_at": "2013-12-25T14:56:44+01:00",
    "started_at": null,
    "finished_at": null,
    "html_url": "https://semaphoreapp.com/darkofabijan/semaphore/branches/development/builds/132"
}
```
