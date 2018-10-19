---
layout: post
title: CruiseControl status
category: Integrations
---

Semaphore provides CruiseControl status (CCTray / CCMenu) API endpoint.

<p class="alert alert-warning">
This endpoint requires the user to provide his authentication token via <strong>auth_token</strong> parameter.
</p>

```bash
/api/v1/projects/:hash_id/cc.xml?auth_token=:auth_token&ccmenu=cc.xml
```

#### Arguments

- `auth_token` users authentication token
- `hash_id` of the project

#### Response

```xml
<Projects>
  <Project name="semaphore - development" activity="Sleeping" lastBuildStatus="Success" lastBuildLabel="1197" lastBuildTime="2013-08-20T12:48:38+00:00" webUrl="https://semaphoreci.com/projects/XXX/branches/XXX/builds/XXX"></Project>
  <Project name="semaphore - shields_badges" activity="Sleeping" lastBuildStatus="Success" lastBuildLabel="2" lastBuildTime="2013-04-10T11:04:49+00:00" webUrl="https://semaphoreci.com/projects/XXX/branches/XXX/builds/XXX"></Project>
  <Project name="semaphore - master" activity="Sleeping" lastBuildStatus="Success" lastBuildLabel="143" lastBuildTime="2013-08-20T12:51:44+00:00" webUrl="https://semaphoreci.com/projects/XXX/branches/XXX/builds/XXX"></Project>
  <Project name="semaphore - staging" activity="Sleeping" lastBuildStatus="Success" lastBuildLabel="62" lastBuildTime="2013-08-20T12:50:09+00:00" webUrl="https://semaphoreci.com/projects/XXX/branches/XXX/builds/XXX"></Project>
</Projects>
```

#### Authentication token
<p class="alert alert-warning">
To see your authentication token, go to your <strong>Account Settings</strong>. 
The authentication token is at the end of the page, just below the 
<strong>Your Authentication Token</strong> text. Copy the token to the 
clipboard by clicking on <strong>Copy</strong> button.
</p>

#### Project Hash ID
<p class="alert alert-warning">
Project hash ID is located at <strong>Project Settings > Admin page > This project's hash ID</strong>. 
This value can also be copied to the clipboard.
</p>
