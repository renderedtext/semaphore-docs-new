###
# Middleman settings
###

# Time.zone = "UTC"

require_relative "source/docs_renderer"

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :tables => true, :renderer => DocsRenderer
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
ignore "category.html"

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
    pages.sort_by {|p| p.data.title}
  end

  def categories
    sitemap.resources.reject { |p| p.data["category"].nil? }.group_by {|p| p.data["category"] }
  end

  def category_link(category)
    link_to category, category_url(category)
  end

  def category_url(category)
    "/docs/#{category.parameterize}.html"
  end

  def link_to_file_on_github(current_page)
    link_to "Edit this article on GitHub", path_to_file_on_github(current_page), :class => "btn btn-default btn-xs pull-right"
  end

  def path_to_file_on_github(current_page)
    path = current_page.source_file.split("/semaphore-docs-new/").last

    "https://github.com/renderedtext/semaphore-docs-new/blob/master/#{path}"
  end

  def package_name(package)
    data.package_versions[package]["name"]
  end

  def package_version(package)
    data.package_versions[package]["version"]
  end

  def package_versions(package)
    data.package_versions[package]["versions"]
  end

  def package_url(package)
    data.package_versions[package]["url"]
  end

  def page_exists?(url)
    sitemap.resources.find { |p| p.url == url }
  end
end

configure :development do
  if defined? Middleman::PreviewServer # false when doing s3_sync, no idea
    set :protocol, "http://"
    set :host, Middleman::PreviewServer.host
    set :port, Middleman::PreviewServer.port
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

ready do
  categories.each do |category, pages|
    url = category_url(category)
    unless page_exists?(url)
      proxy url, "category.html", :locals => { :category => category, :pages => pages }
    end
  end
end
