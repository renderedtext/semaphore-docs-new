---
layout: post
title: Build status on GitHub or Bitbucket is stuck on "waiting"
category: Build troubleshooting
---

If an issue with the Semaphore Classic webhook on the GitHub website occurs
and the status of the build is not shown properly, we recommend taking the
following steps to fix the issue:

For **GitHub** repositories: In order to add a webhook please go to **Project
Settings > Repository** in Semaphore Classic and copy the entire content of the
**Webhook** link to clipboard. Then, on GitHub website, go to **Settings >
Webhooks** and click on **Add webhook**. Name the webhook as you see fit, then
paste the webhook link from the clipboard to **Payload URL** and under the
**Which events would you like to trigger this webhook? > Let me select
individual events** select **Pull requests** and **Pushes** events. Make sure
the checkbox next to **Active** is checked and click on the **Save** button.

For **Bitbucket** repositories: In order to add a webhook please go to **Project
Settings > Repository** in Semaphore Classic and copy the entire content of the
**Webhook** link to clipboard. Then, on Bitbucket website, go to **Settings >
Webhooks** and click on **Add webhook**. Name the webhook as you see fit, then paste
the webhook link from the clipboard to **URL** and under the **Choose from a full
list of triggers > Triggers** select individual events **Push** and **Merged**. Make sure
the checkbox next to **Active** is checked and click on the **Save** button.

Also, please make sure that **Commit status** notification on Semaphore Classic is
checked. You may verify it by going to **Project Settings > Notifications >
Commit status > Enable commit status**.

If this does not work, try removing and adding the same repository again by
going to **Project Settings > Repository** on Semaphore Classic and click on **Change
repository** link at the bottom of the page. This will create all the necessary
webhooks and integration automatically.

**Note:** You need to have at least [Admin permission level](https://semaphoreci.com/docs/organizations/permission-levels-in-an-organization.html) in order to perform
these changes.
