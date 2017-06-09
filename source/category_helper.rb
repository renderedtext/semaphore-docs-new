require_relative "categories/getting_started"
require_relative "categories/docker_support"

def category_options
  options =
    case current_page.data.category
    when "Getting started" then GETTING_STARTED_OPTIONS
    when "Docker" then DOCKER_SUPPORT_OPTIONS
    else []
    end

  clone_with_current_selected(options)
end

def clone_with_current_selected(options)
  options.map do |const_option|
    option = const_option.clone

    option[:current] = true if current_page.data.title == option[:full_title]

    option
  end
end
