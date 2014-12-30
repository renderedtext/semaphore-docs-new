---
layout: post
title: Managing email addresses
category: Notifications
---

You're able to add multiple email addresses to your Semaphore account. This
is done from your Account Settings page.

<img src="/docs/assets/img/email_addresses/email_list.png" class="img-responsive">

Each new email you add needs to be verified. Once you do that, the email
can be used as an option in project's notification settings. Email adresses are
globally unique on Semaphore, so two users cannot add (and verify) the same
address.

### Why should you add multiple emails

If a user is subscribed to [personal work notifications](/docs/subscribe-to-your-work.html)
Semaphore will use his verified email adresses to match git commits
with his Semaphore account.

### Primary email

The "Primary email address" is the one you are using to sign in on Semaphore. It
is also the default address for email notifications on all new projects.

There can be only one "Primary email address" per account and it can be later
changed to any verified email address. Email cannot be deleted while it's used
as primary.
