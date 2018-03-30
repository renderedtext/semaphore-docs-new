---
layout: post
title: How to forward the browser window from an SSH session on Semaphore?
category: Build troubleshooting
---

When debugging failed test you can forward browser window from the SSH session
to your local computer.
That way you can run the server in [an SSH session](/docs/ssh-access-to-build-environment.html)
and inspect the site on your local machine.

### For Mac

- install [XQuartz](https://www.xquartz.org/) on your machine
- start [an SSH session](/docs/ssh-access-to-build-environment.html) from one of your builds
- when the session is started add '-AX' after 'ssh' in the command which
 Semaphore gives you. Example:

```bash
ssh -AX -o StrictHostKeychecking=no -p 49204 runner@136.243.57.31
```

- in the SSH session run the following command
in order to replace the current DISPLAY

```bash
export DISPLAY=localhost:10
```

Now if you start any of the browsers in the SSH session,
their window should be visible on your machine:

```bash
firefox &
```

OR

```bash
google-chrome-stable &
```
Running a single integration spec should be visible as well.
