---
layout: post
title: Enabling Insights
category: Insights
---

If you want Semaphore to show you Insights on your project, you will have to
start by enabling this feature.

To enable Insights for your project, follow the **Add-ons** link on the project
page.

<img src="/docs/assets/img/insights/project_header.png" alt="Add-ons
feature" class="img-responsive img-bordered">

Here you will see the _Insights_ option.

<img src="/docs/assets/img/insights/insights_option.png" alt="Insights
option" class="img-responsive img-bordered">

Follow the **Insights** link and you will see a list of currently supported
frameworks.

<img src="/docs/assets/img/insights/framework_list.png" alt="Framework
list" class="img-responsive img-bordered">

You use Insights by enabling them for the frameworks you use in your project.
For example, if you use _RSpec_ and _Cucumber_, and you want Insights for both
frameworks, you will have to enable them for each framework.

## Enabling Insights for a test framework
When you choose the desired framework, the first step is to click
**Enable**.

<img src="/docs/assets/img/insights/enable_insights.png" alt="Enable
Insights" class="img-responsive img-bordered">

After that, each time you run a build, Semaphore will gather info
on your test files' running time. You can click **Start build** right away and
it will build your project's latest code revision. You need at least one
successful build after clicking the **Enable** button to have some report on
your test files.

<img src="/docs/assets/img/insights/start_build.png" alt="Start
build" class="img-responsive img-bordered">


## Further reading
- [Interpreting Insights data](/docs/insights/interpreting-insights-data.html)
- [Insights troubleshooting](/docs/insights/insights-troubleshooting.html)
