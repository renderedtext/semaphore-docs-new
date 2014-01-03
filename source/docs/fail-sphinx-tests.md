---
layout: post
title: Fail: Sphinx tests
category: Build troubleshooting
---

If you are using Thinking Sphinx, make sure that that you run this command before your tests:

```bash
RAILS_ENV=test bundle exec rake ts:index
```

Than you can either run

```bash
RAILS_ENV=test bundle exec rake ts:start &
```

or use

```bash
ThinkingSphinx::Test.start
ThinkingSphinx::Test.stop
```

directly in the source code of your tests.
