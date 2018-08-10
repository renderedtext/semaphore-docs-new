---
layout: post
title: Removing a user from your organization
category: Organizations
---

If a user in your organization no longer requires access to any of the projects
they have been given access to, you can remove them from the organization.

##How to remove a user from an organization

Only users who are in the _Owners_ team can remove other users from an
organization. In order to remove a user from your organization, you need to:

1. Go to your **Account** in the main menu.
<br><img src="/docs/assets/img/setting-up-an-organization/account.png" alt="Semaphore account" class="img-responsive img-bordered">

2. Click on the **Organizations** tab and select the organization you would like
to manage.
<br><img src="/docs/assets/img/can-i-limit-the-permissions-a-user-has-on-a-specific-project/select-organization.png" alt="Organizations tab" class="img-responsive img-bordered">

3. On the left side of your organization page, click on **Members** under
_Manage Organization_.
<br><img src="/docs/assets/img/removing-a-user-from-your-organization/members.png" alt="Organization members" class="img-responsive img-bordered">

4. Select the member you would like to remove from all teams.
<br><img src="/docs/assets/img/removing-a-user-from-your-organization/select-member.png" alt="Select member" class="img-responsive img-bordered">

5. Remove the user from the organization by clicking on **Remove Selected**.
<br><img src="/docs/assets/img/removing-a-user-from-your-organization/remove-selected-member.png" alt="Remove selected member" class="img-responsive img-bordered">


##How to remove a user who has created some projects in your organization

In order to remove the user who has created some projects, it is necessary to
replace user-project association first.
For security reasons, we are not able to do this on your behalf, and you can do
it by following the next steps:

1. Go to Project Settings page
2. Choose Repository tab
3. Click on the "Change repository" button in the bottom right corner.

This way, these projects will become associated with your GitHub/Bitbucket account.
These steps should be repeated for all project created by the user you would
like to remove from the organization. This can be performed by any member of the
Owners team in your organization.

Also, in order to perform this action, the user has to have the same level of
permissions for the repository as for [adding a project to Semaphore](/docs/adding-github-bitbucket-project-to-semaphore.html).

Projects which are associated with the specific user can be listed as follows:

1. In the top right corner of any Semaphore's page, click on your profile photo,
then choose a relevant organization from the drop down menu.
2. On the left side of the organization's page click on Projects.

##Further reading

- [Learn more about Semaphore organizations](/docs/organizations/about-organizations.html)
- [Removing a user from a team in your organization](/docs/organizations/removing-a-user-from-a-team-in-your-organization.html)
- [Adding a user to an organization](/docs/organizations/adding-a-user-to-an-organization.html)
- [Limiting the permissions a user has on a project](/docs/organizations/can-i-limit-the-permissions-a-user-has-on-a-specific-project.html)
