Dir["source/categories/*.rb"].each { |file| require_relative file.split("/").drop(1).join("/") }

CONTENTS = [
  {
    :class => "docs-nav-home",
    :href => "index.html",
    :title => "Docs Home"
  }, {
    :class => "docs-nav-start",
    :href => "getting-started",
    :title => "Getting Started",
    :key => GETTING_STARTED_KEY
  }, {
    :class => "docs-nav-language",
    :href => "languages",
    :title => "Language Support",
    :key => LANGUAGE_SUPPORT_KEY,
    :subcategories => LANGUAGE_SUPPORT_SUBCATEGORIES
  }, {
    :class => "docs-nav-database",
    :href => "databases",
    :title => "Database support",
    :key => DATABASE_SUPPORT_KEY
  }, {
    :class => "docs-nav-docker",
    :href => "docker",
    :title => "Docker support",
    :key => DOCKER_SUPPORT_KEY
  }, {
    :class => "docs-nav-platform",
    :href => "the-semaphore-platform",
    :title => "The Semaphore platform",
    :key => SEMAPHORE_PLATFORM_KEY
  }, {
    :class => "docs-nav-git",
    :href => "git-services",
    :title => "Git Services",
    :key => GIT_SERVICES_KEY
  }, {
    :class => "docs-nav-customize",
    :href => "customizing-your-build",
    :title => "Customizing your build",
    :key => BUILD_CUSTOMIZATION_KEY
  }, {
    :class => "docs-nav-adapting",
    :href => "adapting-semaphore-to-your-workflow",
    :title => "Adapting Semaphore",
    :key => ADAPTING_SEMAPHORE_KEY
  }, {
    :class => "docs-nav-dependencies",
    :href => "managing-dependencies",
    :title => "Managing dependencies",
    :key => MANAGING_DEPENDENCIES_KEY
  }, {
    :class => "docs-nav-troubleshooting",
    :href => "build-troubleshooting",
    :title => "Build troubleshooting",
    :key => BUILD_TROUBLESHOOTING_KEY
  }, {
    :class => "docs-nav-deploy",
    :href => "deploying-your-application",
    :title => "Deploying your application",
    :key => DEPLOYMENT_KEY
  }, {
    :class => "docs-nav-insights",
    :href => "insights",
    :title => "Insights",
    :key => INSIGHTS_KEY
  }, {
    :class => "docs-nav-collaboartion",
    :href => "collaboration",
    :title => "Collaboration",
    :key => COLLABORATION_KEY
  }, {
    :class => "docs-nav-organisations",
    :href => "organizations",
    :title => "Organizations",
    :key => ORGANIZATIONS_KEY
  }, {
    :class => "docs-nav-twostep",
    :href => "two-step-verification",
    :title => "Two-Step Verification",
    :key => TWO_STEP_VERIFICATION_KEY
  }, {
    :class => "docs-nav-notifications",
    :href => "notifications",
    :title => "Notifications",
    :key => NOTIFICATIONS_KEY
  }, {
    :class => "docs-nav-api",
    :href => "api",
    :title => "API",
    :key => API_KEY
  }, {
    :class => "docs-nav-billing",
    :href => "billing",
    :title => "Billing"
  }, {
    :class => "docs-nav-guides",
    :href => "#",
    :title => "Guides"
  }
]

def category_match?(category, category_key)
  category[:key] == category_key || category[:subcategories].to_a.include?(category_key)
end
