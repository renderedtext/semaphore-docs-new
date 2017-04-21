---
layout: post
title: Managing chat notifications
category: Notifications
---

Semaphore features a chat notification system that lets you receive status
update messages directly in [Campfire](https://campfirenow.com/),
[Flowdock](https://www.flowdock.com/), [HipChat](https://www.hipchat.com/),
and [Slack](https://slack.com/).

## Finding tokens

For Slack, within a chat room open the cog ("Change settings") > "Add an app
or integration". Search for "Semaphore", select a channel and you'll reach
instructions and integration settings, as below.

<img src="/docs/assets/img/managing-chat-notifications/slack-integration-settings.png" alt="Slack integration settings for Semaphore" class="img-responsive img-bordered">

Copy the webhook URL, save the integration and open return to Semaphore.

For Hipchat, see a separate [guide for finding the right token](/docs/finding-hipchat-token.html).

## Setting up notifications on Semaphore

Head over to your project settings, click on the
**Notifications** tab, and choose your service. The screenshots feature Slack
settings, but the build and deploy forms are identical across all services.

<img src="/docs/assets/img/managing-chat-notifications/setting-up-notifications.png" alt="Setting up notifications" class="img-responsive img-bordered">

Note that notifications can only be set up and modified by users who have admin 
access to a project.

## Modifying notification policies

For both builds and deploys, Semaphore offers several filters to better control
what information you're subscribed to:

- **Always** — Notify after every build or deploy.
- **Never** — Do not notify after any build or deploy.
- **Failed only** — Notify only if the build or deploy fails (or is stopped
manually).
- **Change status** (applies to builds only) — Notify only the build breaks,
continues to fail, or has been fixed.

### Choosing for which branches build notifications are sent

Specifically for builds, you may choose to only receive notifications for a
certain subset of branches. You can do this by selecting **From whitelist** in
the **Select branches** dropdown box. A whitelist will appear, accepting [Ruby
regular expressions](http://ruby-doc.org/core-2.2.3/Regexp.html). Each line
specifies a branch name pattern for which notifications will be sent.

<img src="/docs/assets/img/managing-chat-notifications/branch-whitelist.png" alt="Branch whitelist" class="img-responsive img-bordered">

### Choosing for which servers deploy notifications are sent

If your project has deployment set up, a deploy section will appear in your chat
notification settings, along with a checkbox list of configured servers. Untick
any servers for which you do not wish to receive deploy notifications.

<img src="/docs/assets/img/managing-chat-notifications/server-checkboxes.png" alt="Server checkboxes" class="img-responsive img-bordered">

Save your settings, and you're done!
