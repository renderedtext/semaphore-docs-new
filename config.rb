###
# Middleman settings
###

# Time.zone = "UTC"

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
activate :syntax #https://github.com/middleman/middleman-syntax

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

# Used for generating absolute URLs:
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

  def categories
    sitemap.resources.reject{ |p| p.data["category"].nil? }.group_by {|p| p.data["category"] }
  end

end

configure :development do
  if defined? Middleman::PreviewServer # false when doing s3_sync, no idea
    set :protocol, "http://"
    set :host, Middleman::PreviewServer.host
    set :port, Middleman::PreviewServer.port
  else
    set :protocol, "https://"
    set :host, "semaphoreapp.com"
    set :port, 80
  end
end

configure :build do
  set :protocol, "https://"
  set :host, "semaphoreapp.com"
  set :port, 80
end
