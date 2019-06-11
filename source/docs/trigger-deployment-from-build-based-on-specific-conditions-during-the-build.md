---
layout: post
title: Trigger deployment from build based on specific conditions during the build
category: Deploying your application
---

If deployment strategy is set to Automatic, deployment will be triggered automatically after a successful build. Failed builds do not trigger the deployment.

During the build, you may assess all the necessary conditions which are relevant for deployment. It's recommended putting the assessment commands in a single shell script, if possible. If the tested conditions are not met, you may fail the assessment script by using exit code other than zero. Failing the script would result in failed build and the automatic deployment would not trigger.
