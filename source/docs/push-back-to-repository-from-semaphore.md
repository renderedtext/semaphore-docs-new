---
layout: post
title: Push back to repository from Semaphore Classic without triggering the build
category: Adapting Semaphore
---

After the Semaphore Classic build is done, you would like to push the updated
FILE in the project (which gets updated during the build on Semaphore) back to
your GitHub repo. However, if a push is made to the GitHub repo, it will
trigger a build on Semaphore, leading to an infinite build recursion.

To skip building a commit, putting **[ci skip]** or **[skip ci]** anywhere in the
commit message is enough. Before committing the FILE, a minimal git setup
should be performed. Setting the name and email is required for being able to
make the commits. Something similar to the following should be added to your
project:

```bash
# Setup
git config --global user.email "<your-email@example.com>"
git config --global user.name "<your_name>"

# Job
git add FILE
git commit -m "Automatically updating the FILE file [skip ci]"
git push origin master
```

This should allow you to update the FILE in your repository, but not trigger
the new build.
