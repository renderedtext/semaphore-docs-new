---
layout: post
title: Transferring a project to an organization
category: Organizations
---

Any project in your user account can be transferred to an organization.
Organizations allow teams to have multiple project owners and different
permission levels for collaborators on different projects.

Only Owners and members of teams with [Admin access](/docs/organizations/permission-levels-in-an-organization.html) can add
projects to an organization.

##How to transfer a project to an organization

Transferring a project to an organization is simple:

1. Go to your **Account** in the main menu and select the **Account Settings**
tab.

 <img src="/docs/assets/img/transferring-a-project-to-an-organization/account-settings-tab.png" class="img-responsive img-bordered">

2. Scroll to the bottom of the page and click on **Transfer** next to the
name of the project you would like to transfer.

 <img src="/docs/assets/img/transferring-a-project-to-an-organization/transfer.png" alt="Transfer project" class="img-responsive img-bordered">

3. Select the organization to which you would like to transfer the project
and click on **Transfer**.

 <img src="/docs/assets/img/transferring-a-project-to-an-organization/select-organization-and-transfer.png" alt="Select organization and transfer project" class="img-responsive img-bordered">

Your project has now been successfully transferred to your organization. You
can access it and manage its settings under _Projects_ on your organization's
page. Note that once you have transferred a project to an organization, you
cannot transfer it back to your user account, you can only remove it from the
organization and re-add it to your user account.

##Next steps

Transferring a project to a Semaphore organization gives all the members of the
_Owners_ team immediate administrative access to the project, and creates a new
team to which you can add collaborators for that project. In case you already had
collaborators on your project, Semaphore will automatically transfer them together
with the project and create new team called "collaborators team for _project name_".
This new team will have [Edit permission level](/docs/organizations/permission-levels-in-an-organization.html)
by default. If you would like to further limit  access permissions for some project
collaborators, you can [create additional teams](/docs/organizations/creating-a-team.html)
with different permission levels, or change permission levels for the existing teams.

##Further reading

- [Learn more about Semaphore organizations](/docs/organizations/about-organizations.html)
- [Setting up an organization](/docs/organizations/setting-up-an-organization.html)
- [Limiting the permissions a user has on a specific project in an organization](/docs/organizations/can-i-limit-the-permissions-a-user-has-on-a-specific-project.html)
- [Permission levels in an organization](/docs/organizations/permission-levels-in-an-organization.html)
