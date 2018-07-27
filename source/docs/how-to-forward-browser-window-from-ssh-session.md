---
layout: post
title: How to forward the browser window from a Semaphore SSH session to my local machine?
category: Build troubleshooting
---

It's often not so clear why an integration test fails, and it's convenient to
see it first hand. When debugging a build or deployment, the browser from the
SSH session can be forwarded to your local machine, so that you have a visual on
the issue.
Additionally, if you start a webserver inside the SSH session, that can be
forwarded to your local machine as well, and it can be accessed from your own
browser.

To continue, make sure you've configured [SSH access](/docs/ssh-access-to-build-environment.html)
on your Semaphore account.

We will explore 3 possible approaches.

## Webserver over an SSH tunnel

Suitable for when you want to access content, served inside the SSH session (Apache2, `php -s`, `rails server`, etc.).
This approach is the **fastest**. However, if you want to use the exact same browser,
which is used during a Semaphore run, the other options should be explored, which
forward the complete browser.

### How to do it?

Once the SSH session has been started, expand the generated command with `-L 7654:localhost:80`,
like so:

```bash
ssh -L 7654:localhost:80 -o StrictHostKeychecking=no -p 44982 runner@138.201.32.20
```

This utilizes SSH's local port forwarding.

In the example above, `7654` is the port on your local machine, which will be tunneled
to `localhost:80` inside the running SSH session. If the Apache2 server is running inside the SSH session on port 80,
when you visit `http://localhost:7654` on your local machine, you should see the
default Apache2 homepage.

Of course, you can use any other port, on which your webserver is running inside the SSH session.

**Note**: the tunnel will remain active, as long as your local machine is connected
to the SSH session, with the modified command.


## VNC over an SSH tunnel

This approach forwards the complete virtual screen from Semaphore's SSH session to your
local machine. Handy when you want your debugging to entirely happen inside the
Semaphore environment, using one of the shipped browsers.

Like in the previous section, we'll use an SSH tunnel, but this time, we will
connect to a VNC server in the SSH session, with a VNC client on your local machine.

### How to do it?

Once the SSH session has been started, expand the generated command with `-L 5900:localhost:5900`,
like so:

```bash
$ ssh -L 5900:localhost:5900 -o StrictHostKeychecking=no -p 44982 runner@138.201.32.20
```

The command will connect to the SSH session, and forward connections from your
local machine's port `5900` to `localhost:5900` inside the SSH session.

Once you're connected, run the following to setup and start the VNC server in the
SSH session.

```bash
# install
$ sudo apt-get install -y x11vnc

# if you're on the Docker Light platform, install Xvfb with the following script
$ curl -L https://gist.githubusercontent.com/rtgkurel/d4b5f41a814d2c032955ed61f231792e/raw/xvfb-dockerl.sh | sudo bash

# start
$ x11vnc -safer -localhost -nopw -forever -display $DISPLAY &
```

Now, on your local machine install a VNC client, and connect to the server in the
SSH session.

```bash
# Ubuntu
$ wget https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.18.625-Linux-x64.deb
$ sudo dpkg -i VNC-Viewer-6.18.625-Linux-x64.deb

$ vncviewer
```

For a Mac client visit
[https://www.realvnc.com/en/connect/download/viewer/macos/](https://www.realvnc.com/en/connect/download/viewer/macos/)
and start `VNC Viewer` after the installation.

In VNC Viewer, enter `localhost:5900` and connect. This connects to your local
machines port `5900` which is forwarded to the VNC server inside the SSH session.

Start one of the browsers in the SSH session, with the following commands:

```bash
# Firefox
$ firefox &

# Google Chrome
$ google-chrome --disable-gpu &
```

The browser window should appear inside VNC Viewer.

**Note**: the tunnel will remain active, as long as your local machine is connected
to the SSH session, with the modified command.

## Forward X over SSH

This approach is a bit dated and slow, but it can be helpful in some cases.

### For Mac/Linux
- [Mac only] install [XQuartz](https://www.xquartz.org/) on your machine
- start [an SSH session](/docs/ssh-access-to-build-environment.html) from one of your builds
- when the session is started add '-ACX' after 'ssh' in the command which
 Semaphore gives you. Example:

```bash
$ ssh -ACX -o StrictHostKeychecking=no -p 49204 runner@136.243.57.31
```

- in the SSH session run the following command
in order to replace the current DISPLAY

```bash
$ export DISPLAY=localhost:10
```

Now if you start any of the browsers in the SSH session,
their window should be visible on your machine:

```bash
# Firefox
$ firefox &

# Google Chrome
$ google-chrome --disable-gpu &
```

### Troubleshooting

If you're having difficulties forwarding a browser window, try installing the
X11 apps package, and see if you can forward one of them.

```bash
$ sudo apt-get install -y x11-apps

# the command below should start a window, where two eyeballs will follow your cursor
$ x11eyes
```
