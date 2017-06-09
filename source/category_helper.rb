require_relative "categories/getting_started"
require_relative "categories/language_support"
require_relative "categories/database_support"
require_relative "categories/docker_support"

def category_options
  case current_page.data.category
  when GETTING_STARTED_KEY then GETTING_STARTED_OPTIONS
  when LANGUAGE_SUPPORT_KEY, *LANGUAGE_SUPPORT_SUBCATEGORIES then LANGUAGE_SUPPORT_OPTIONS
  when DATABASE_SUPPORT_KEY then DATABASE_SUPPORT_OPTIONS
  when DOCKER_SUPPORT_KEY then DOCKER_SUPPORT_OPTIONS
  else []
  end
end
