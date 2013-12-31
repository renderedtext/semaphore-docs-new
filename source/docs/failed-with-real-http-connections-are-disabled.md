---
layout: post
title: Tests or setup failed with “Real HTTP connections are disabled.”
category: Build troubleshooting
---

If you’re using webmock: as webmock is required by default, it disables all HTTP connections (including connections to localhost). What you can do is disable autorequire for webmock in Gemfile and disable connections by hand in the spec helper.
