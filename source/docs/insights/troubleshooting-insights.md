---
layout: post
title: Insights troubleshooting
category: Insights
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

When you turn RSpec Insights on on a project, Semaphore will set the value of
`SPEC_OPTS` environment variable:

```bash
export SPEC_OPTS="--format documentation --format json --out rspec_report.json"
```

However, if your project is using the `SPEC_OPTS` environment variable to pass
options to the RSpec runner, they will override the options that Semaphore
previously set and Semaphore will not be able to gather stats for the Insights.

A typical user RSpec command with the `SPEC_OPTS` environment variable might
look like this:

```bash
bundle exec rake spec SPEC_OPTS="--order random"
```

To use Insights, replace the `SPEC_OPTS` environment variable with an `.rspec`
file.  You can commit the file to the repository. In that case, these options
will be used on all development machines, unless a developer overrides them. If
you don't want to commit the `.rspec` file to the project repository, you can
create the file using [custom configuration
files](/docs/adding-configuration-files.html). That way, the `.rspec`
file will be available only on Semaphore.

An alternative is to construct the `SPEC_OPTS` environment variable yourself.
The variable should include `--format json --out rspec_report.json` and all the
options you need.

#### Your tests are executed using parallel_test gem

If you run your RSpec tests using parallel_test gem, the report with stats for
each test example will not be in valid format, and you will not be able to use
Insights. The issue is described in detail at the official [parallel_tests
issues](https://github.com/grosser/parallel_tests/issues/266) page.

#### Your tests are executed using rspec_rerun gem

`rspec_rerun` gem is using a special formatter to save the report about failed
tests. When you turn on Insights for a project that's using `rspec_rerun`,
Semaphore overrides the formatter used by `rspec_rerun` and your tests will fail
with an error such as:

```
Errno::ENOENT: No such file or directory @ rb_sysopen - rspec.failures
```

To use RSpec Insights in combination with `rspec_rerun`, you need to set options
for both Semaphore Insights and `rspec_rerun` in the `SPEC_OPTS` environment
variable. Change your RSpec command to look like this:

```bash
SPEC_OPTS="--format documentation --format json --out rspec_report.json --require rspec-rerun/formatter --format RSpec::Rerun::Formatter" bundle exec rake rspec-rerun:spec
```

After that, your tests should work as expected and Semaphore should be able to
collect Insights data for the project.
