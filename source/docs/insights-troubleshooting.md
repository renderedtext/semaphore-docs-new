---
layout: post
title: Insights troubleshooting
category: Insights troubleshooting
---

If you have turned Insights on for a project on Semaphore, but you don't see any
test files on the Insights page, or some stats are missing, this guide will help
you find the source of the problem.

Semaphore supports Insights for RSpec and Cucumber testing frameworks. If you
are using some other framework, but you would still like to use Insights, please
[let us know](https://renderedtext.typeform.com/to/d1fWsl) by answering few
short questions.

## RSpec

At the moment, Semaphore supports only RSpec 3.x. If you are using earlier
versions of RSpec, it's likely that you will see test files on the Insights
page, but you won't see all stats. Percentage of passed builds will be visible,
but stats for mean time, max time and standard deviation will be missing. The
solution to this problem is to upgrade to a newer version of RSpec.

If you use RSpec 3.x, but you don't see any test files on the Insights page,
there are a few possible causes described below.

#### All test files finish faster than 10 seconds

Semaphore Insights are displayed only for test files that take more than 10
seconds to finish.

#### Your options are defined with the SPEC_OPTS environment variable

There are a few ways to pass configuration options to RSpec runner:

- `SPEC_OPTS` environment variable
- `.rspec` file
- command line options

When you turn RSpec Insights on on a project, Semaphore will generate an
`.rspec` file if it does not already exist, and inject `--format json` option in
the file.  However, if your project is using the `SPEC_OPTS` environment
variable to pass options to the RSpec runner, they will override the options in
the `.rspec` file and Semaphore will not be able to gather stats for the
Insights.

A typical RSpec command with `SPEC_OPTS` might look like this:

```bash
bundle exec rake spec SPEC_OPTS="--format documentation"
```

To use Insights, replace the `SPEC_OPTS` environment variable with an `.rspec`
file.  You can commit the file to the repository. In that case, these options
will be used on all development machines, unless a developer overrides them. If
you don't want to commit the `.rspec` file to the project repository, you can
create the file using [custom configuration
files](/docs/adding-custom-configuration-files.html). That way, the `.rspec`
file will be available only on Semaphore.

#### Your tests are executed using parallel_test gem

If you run your RSpec tests using parallel_test gem, the report with stats for
each test example will not be in valid format, and you will not be able to use
Insights. The issue is described in detail at the official [parallel_tests
issues](https://github.com/grosser/parallel_tests/issues/266) page.
