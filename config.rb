###
# Middleman settings
###

# Time.zone = "UTC"

require "raml_parser"

require "./source/docs_renderer"
require "./source/docs_helpers"

require "./source/api_v2"
require "./source/cli"

helpers DocsHelpers

set :markdown_engine, :redcarpet
set :markdown, :with_toc_data => true, :fenced_code_blocks => true, :smartypants => true, :tables => true, :renderer => DocsRenderer
activate :syntax #https://github.com/middleman/middleman-syntax

activate :sitemap, :hostname => "https://semaphoreci.com"
activate :alias

#Activate sync extension
activate :s3_sync do |s3_sync|
  s3_sync.bucket                = data.credentials.aws.bucket
  s3_sync.aws_access_key_id     = data.credentials.aws.access_key_id
  s3_sync.aws_secret_access_key = data.credentials.aws.secret_access_key
  s3_sync.delete                = false # We delete stray files by default.
  s3_sync.after_build           = false # We chain after the build step by default. This may not be your desired behavior...
end


ApiV2.specification.resources.each do |resource|
  proxy "/docs/api-v2-#{resource.name.gsub("_", "-")}.html",
        "/docs/api-v2-resource.html",
        :locals => { :resource => resource },
        :ignore => true
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

set :css_dir, 'assets/css'

set :js_dir, 'assets/js'

set :images_dir, 'assets/images'

ignore "post.html"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

helpers do

  def host_with_port
    [host, optional_port].compact.join(':')
  end

  def optional_port
    port unless port.to_i == 80
  end

  def image_url(source)
    protocol + host_with_port + image_path(source)
  end

  def sort_pages(pages)
    pages.sort_by {|p| p.data.title.to_s }
  end

  def link_to_file_on_github(current_page)
    link_to "Edit this article on GitHub", path_to_file_on_github(current_page), :class => "btn btn-default btn-xs pull-right"
  end

  def path_to_file_on_github(current_page)
    path = current_page.source_file.split("/semaphore-docs-new/").last

    "https://github.com/renderedtext/semaphore-docs-new/blob/master/#{path}"
  end

  def package_name(package, platform = "standard")
    data.package_versions[platform][package]["name"]
  end

  def default_package_version(package, platform = "standard")
    data.package_versions[platform][package]["default"].first
  end

  def package_version(package, platform = "standard")
    data.package_versions[platform][package]["version"]
  end

  def package_versions(package, platform = "standard")
    data.package_versions[platform][package]["versions"]
  end

  def package_url(package, platform = "standard")
    data.package_versions[platform][package]["url"]
  end

  def page_exists?(url)
    sitemap.resources.find { |p| p.url == url }
  end

  def current_page_as_referer
    current_page.path.gsub("/", "-").gsub(".html", "")
  end

  def sign_up_path_with_referer
    "/users/sign_up?from=docs&referer=#{current_page_as_referer}"
  end
end

configure :development do
  if defined? Middleman::PreviewServer # false when doing s3_sync, no idea
    set :protocol, "http://"
  else
    set :protocol, "https://"
    set :host, "semaphoreci.com"
    set :port, 80
  end
end

configure :build do
  set :protocol, "https://"
  set :host, "semaphoreci.com"
  set :port, 80
end

require "lib/docs_helpers"
helpers DocsHelpers
