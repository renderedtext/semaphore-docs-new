---
layout: post
title: Enabling Test file performance Insights
category: Insights
---

If you want Semaphore to show Test file performance Insights on your project,
you can start by enabling this particular feature:

1. Follow the **Insights** link on your project page.

2. Go to **Test file performance** tab.

    You will see a list of currently supported frameworks.

3. Choose a framework for which you want to enable Test file performance
   Insights.

    For example, if you're using _RSpec_ and _Cucumber_, and you want Test file
    performance Insights for both frameworks, you'll need to enable them for each
    framework separately.

4. Click **Enable**.

    After this, each time you run a build, Semaphore will gather info on build
    running time for that project.
    You can click **Start build** right away, and it will build your project's
    latest code revision. You need at least one successful build after clicking
    the **Enable** button in order to be able to get a report on your test files.

## Further reading
- [Interpreting Test file performance data](/docs/insights/interpreting-insights-data.html)
- [Test file performance troubleshooting](/docs/insights/troubleshooting-insights.html)
