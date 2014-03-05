---
layout: post
title: Post-deploy webhooks
category: Notifications
---

Semaphore allows you to set up webhooks that will receive payload about every finished deploy.  You can use them, for example, to implement alerts through [Hubot](http://hubot.github.com/), or keep track of your projects on a company dashboard.

To set up one or more webhooks for your project, follow these steps:

- Click on "settings" next to your project on the dashboard.

<img src="/docs/assets/img/webhooks/project-settings-link.png" class="img-responsive">

- Open the "Webhooks" tab on project settings page.

<img src="/docs/assets/img/webhooks/webhooks-tab-link.png" class="img-responsive">

- Add a URL to receive the payload.

<img src="/docs/assets/img/webhooks/webhooks.png" class="img-responsive">

- Click on "Test" to receive an example payload and verify that it all works.

- Save your settings.

### Payload format

Payload is JSON in the same structure as [deploy notification API](/docs/servers-and-deploys-api.html).

```json
{
  "project_name": "heroku-deploy-test",
  "project_hash_id": "123-aga-471-6a8",
  "result": "passed",
  "event": "deploy",
  "server_name": "server-heroku-master-automatic-2",
  "number": 2,
  "created_at": "2013-07-30T13:52:33Z",
  "updated_at": "2013-07-30T13:53:21Z",
  "started_at": "2013-07-30T13:52:38Z",
  "finished_at": "2013-07-30T13:53:21Z",
  "html_url": "https://semaphoreapp.com/projects/2420/servers/81/deploys/2",
  "build_number": 10,
  "branch_name": "master",
  "branch_html_url": "https://semaphoreapp.com/projects/2420/branches/58394",
  "build_html_url": "https://semaphoreapp.com/projects/2420/branches/58394/builds/7",
  "commit": {
    "author_email": "rastasheep3@gmail.com",
    "author_name": "Aleksandar Diklic",
    "id": "43ddb7516ecc743f0563abd7418f0bd3617348c4",
    "message": "One more time",
    "timestamp": "2013-07-19T12:56:25Z",
    "url": "https://github.com/rastasheep/heroku-deploy-test/commit/43ddb7516ecc743f0563abd7418f0bd3617348c4"
  }
}
```

### Note

In case that there is no build present for finished deploy, folowing fields will be `null`:

- `build_number` 
- `build_html_url`
- `branch_name`
- `branch_html_url`


### Retry on failure

In case of a delivery failure, Semaphore will retry, twice, to send the webhook.
