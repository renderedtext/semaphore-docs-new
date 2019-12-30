#!/usr/bin/env ruby
#
# Validates links in Middleman generated pages using http-proover
# -
# The latest version of http-proover requires major gem updates in the repository
# so the script is currently self contained -- the gem is not part of the main
# Gemfile and it has to be installed manually
# -
# https://github.com/gjtorikian/html-proofer

TARGET_DIRECTORY = "#{File.expand_path File.dirname(__FILE__)}/../build"

# Ignored string in paths eg. www.semaphoreci.com/docs/pricing
## These links appear mostly in the header/footer -- these paths need to addressed
ignored_paths = %w(
/pricing
/privacy
/community
/contact
/tos
/security
/press
/support
/feed
)

ignored_paths << /product/
ignored_paths << /about/
ignored_paths << /customers/

# Ignored regular expression in paths eg. www.semaphoreci.com/docs/users?sign_in
ignored_paths.concat [ /^\/$/, /renderedtext/, /blog/, /users/ ]

options = {
  :extension => ".html",
  :allow_hash_href => true,
  :alt_ignore => [/.*/],
  :url_ignore => ignored_paths,
  :http_status_ignore => [0],
  :checks_to_ignore => ['ScriptCheck'],
  :typhoeus =>
  {
    :followlocation => true,
    :connecttimeout => 30,
    :timeout => 60,
    :ssl_verifypeer => false,
    :ssl_verifyhost => 0
  }
}

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem "html-proofer", "=3.14.1"
  gem "nokogiri"
  gem "i18n"
end

puts 'Gems installed and loaded!'

require "html-proofer"

puts ">> Building pages with Middleman"
system("cd #{File.expand_path Dir.pwd}; bundle exec middleman build")

HTMLProofer.check_directory(TARGET_DIRECTORY, options).run
