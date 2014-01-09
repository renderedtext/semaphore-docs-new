---
layout: post
title: How can I add or remove a collaborator from my project?
category: Collaboration
---

Semaphore synchronizes the collaborator list with GitHub across all projects on a daily basis.

If the changes are not reflected in your project on Semaphore, it is likely because your authentication token with GitHub has expired. To update it and complete the collaborator sync, the project owner on Semaphore should go to project settings > “Collaborators” and click on “Sync collaborators from GitHub”.

### Missing owners

All organizations on GitHub include a special team called "Owners". If a project has been added to Semaphore by someone who is not in this list, the owners will not have access to the project. This is a limitation of GitHub API.

To resolve the situation, owners should simply be added to a regular GitHub team like other developers.
