---
layout: post
title: Enabling Test file performance Insights
category: Insights
---

If you want Semaphore to show Test file performance Insights on your project,
you will need to start by enabling this feature.

To enable Test file performance Insights for your project, follow the
**Insights** link on the project page.

<img src="/docs/assets/img/insights/project_header.png" alt="Add-ons
feature" class="img-responsive img-bordered">

Next, click on **Test file performance**.

<img src="/docs/assets/img/insights/insights_option.png" alt="Insights
option" class="img-responsive img-bordered">

You will see a list of currently supported frameworks.

<img src="/docs/assets/img/insights/framework_list.png" alt="Framework
list" class="img-responsive img-bordered">

Enable Test file performance Insights for the frameworks used in your project.
For example, if you're using _RSpec_ and _Cucumber_, and you want Test file
performance Insights for both frameworks, you'll need to enable them for each
framework.

## Enabling Test file performance Insights for a test framework
After you have chosen the desired framework, the next step is to click
**Enable**.

<img src="/docs/assets/img/insights/enable_insights.png" alt="Enable
Insights" class="img-responsive img-bordered">

After that, each time you run a build, Semaphore will gather info on build
running time for that project. You can click **Start build** right away, and it
will build your project's latest code revision. You need at least one
successful build after clicking the **Enable** button in order to be able to
get a report on your test files.

<img src="/docs/assets/img/insights/start_build.png" alt="Start
build" class="img-responsive img-bordered">


## Further reading
- [Interpreting Test file performance data](/docs/insights/interpreting-insights-data.html)
- [Test file performance troubleshooting](/docs/insights/troubleshooting-insights.html)
