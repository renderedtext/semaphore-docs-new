---
layout: post
title: Setting up the BDD stack on a new Rails 4 application
category: Languages
on_homepage: false
---

This tutorial guides you through generating a new Rails 4 application with
[RSpec](https://github.com/rspec/rspec) and [Cucumber](https://github.com/cucumber/cucumber-rails) as testing tools.

### Create the application

```
$ rails new -T myapp
```

The `-T` options skips configuring test.unit. In the tutorial, we use RSpec
instead.

Change path to the new directory and install gems:

```
$ cd myapp
$ bundle install --path vendor/bundle
```

### Install RSpec

Add `rspec-rails` gem to the development and test groups of your Gemfile.

```ruby
group :development, :test do
  gem 'rspec-rails'
end
```

Install the gem:

```
$ bundle install
```

Bootstrap the app with RSpec:

```
$ bundle exec rails generate rspec:install
```

### Install shoulda-matchers

[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) lets us spec
common Rails functionality, like validations and associations, with less code.
This step is optional.

Add `shoulda-matchers` gem to the test group of your Gemfile:

```ruby
group :test do
  gem 'shoulda-matchers'
end
```

Install the gem:

```
$ bundle install
```

### Install Factory Girl

[Factory Girl](https://github.com/thoughtbot/factory_girl) is "a library for
setting up Ruby objects as test data" or more precisely it is a fixtures
replacement.

Add `factory_girl_rails` gem to the development and test groups of your Gemfile:

```ruby
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
```

Install the gem:

```
$ bundle install
```

Factory Girl allows you to create objects that are needed in tests without
providing a value for each required attribute. If you don't provide a value
for a required attribute Factory Girl will use the default value that you
defined in factory's definition.

### Make sure everything is connected and working

Create a Post model:

```
$ bundle exec rails generate model Post title:string content:text
invoke active_record
create db/migrate/20140926125040_create_posts.rb
create app/models/post.rb
invoke rspec
create spec/models/post_spec.rb
invoke factory_girl
create spec/factories/posts.rb
```

Notice, the generator also creates a model spec and a 'posts' factory. That's
the reason why we included the `rspec-rails` and `factory_girl_rails` gems in
the development group of the Gemfile.

Define a post factory:

```ruby
# spec/factories/posts.rb
FactoryGirl.define do
  factory :post do
    title "My first post"
    content "Hello, behavior-driven development world!"
  end
end
```


Update the spec to validate post's title and content:

```ruby
# spec/models/post_spec.rb
require 'spec_helper'
describe Post do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to ensure_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to ensure_length_of(:content).is_at_least(10) }
end
```

And update the Post model with validation definitions:

```ruby
# app/models/post.rb
class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 10 }
end
```

Before running the spec make sure to apply the migration.

```
$ bundle exec rake db:migrate
```

After running the spec you can see it pass:

```
$ bundle exec rspec spec/models/post_spec.rb
```

<img src="/docs/assets/img/languages/ruby/rspec-green.png" class="img-responsive">

### Install Cucumber

Add `cucumber-rails` gem to the test group of the Gemfile.

```ruby
group :test do
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end

```
The `database_cleaner` gem is not required, but it will save you a lot
of headache. It’s used to ensure a clean database state for testing.

Install the gems:

```
$ bundle install
```

Bootstrap the app with Cucumber:

```
$ bundle exec rails generate cucumber:install
```

### Install selenium-webdriver

To be able to run Cucumber scenarios which use Javascript you need `selenium-webdriver`.
Add it to the test group of your Gemfile:

```ruby
group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'selenium-webdriver'
end
```

And install it:

```
$ bundle install
```

### Make sure Cucumber is working correctly

To do that, let's develop a simple feature.

```gherkin
# features/home_page.feature
Feature: Home page

  Scenario: Viewing application's home page
    Given there's a post titled "My first" with "Hello, BDD world!" content
    When I am on the homepage
    Then I should see the "My first" post
```

```ruby
# features/step_definitions/home_page_steps.rb
Given(/^there's a post titled "(.*?)" with "(.*?)" content$/) do |title, content|
  @post = FactoryGirl.create(:post, title: title, content: content)
end

When(/^I am on the homepage$/) do
  visit "/"
end

Then(/^I should see the "(.*?)" post$/) do |title|
  @post = Post.find_by_title(title)
  expect(page).to have_content(@post.title)
  expect(page).to have_content(@post.content)
end
```

```ruby
# config/routes.rb
Myapp::Application.routes.draw do
  root to: "posts#index"
end
```

```ruby
# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
end
```

```erb
<!-- app/views/posts/index.html.erb -->
<ul>
  <% @posts.each do |post| %>
    <li>
      <%= post.title %><br />
      <%= post.content %>
    </li>
  <% end %>
<ul>
```

Now run the feature file and you should see it pass:

```
$ bundle exec cucumber features/home_page.feature
```

<img src="/docs/assets/img/languages/ruby/rspec-green.png" class="img-responsive">

Congratulations for making it this far. You should now be fully equipped to
work in the BDD cycle and deliver clean, working code.
