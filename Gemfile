source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

# Core Rails Stuff
# Full-stack web application framework. (https://rubyonrails.org)
gem "rails", "~> 6.1.5"

# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/] (https://github.com/ged/ruby-pg)
gem "pg", "~> 1.1"

# Puma is a simple, fast, threaded, and highly parallel HTTP 1.1 server for Ruby/Rack applications (https://puma.io)
gem "puma", "~> 5.0"

# Sass adapter for the Rails asset pipeline. (https://github.com/rails/sass-rails)
gem "sass-rails", ">= 6"

# Use webpack to manage app-like JavaScript modules in Rails (https://github.com/rails/webpacker)
gem "webpacker", "~> 5.0"

# Turbolinks makes navigating your web application faster (https://github.com/turbolinks/turbolinks)
gem "turbolinks", "~> 5"

# Create JSON structures via a Builder-style DSL (https://github.com/rails/jbuilder)
gem "jbuilder", "~> 2.7"

# Boot large ruby/rails apps faster (https://github.com/Shopify/bootsnap)
gem "bootsnap", ">= 1.4.4", require: false

# STUFF WE'VE ADDED

# Flexible authentication solution for Rails with Warden (https://github.com/heartcombo/devise)
gem "devise"

# Easily generate fake data (https://github.com/faker-ruby/faker)
gem "faker"

# Presenting names of people in full, familiar, abbreviated, and initialized forms (but without titulation etc) (https://github.com/basecamp/name_of_person)
gem "name_of_person"

# A Ruby client library for Redis (https://github.com/redis/redis-rb)
gem "redis"

# Simple, efficient background processing for Ruby (https://sidekiq.org)
gem "sidekiq"

# Catch unsafe migrations in development (https://github.com/ankane/strong_migrations)
gem "strong_migrations"

group :development, :test do
  # Ruby fast debugger - base + CLI (https://github.com/deivid-rodriguez/byebug)
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  # Autoload dotenv in Rails. (https://github.com/bkeepers/dotenv)
  gem "dotenv-rails"

  # factory_bot_rails provides integration between factory_bot and rails 5.0 or newer (https://github.com/thoughtbot/factory_bot_rails)
  gem "factory_bot_rails"
end

group :development do
  # Annotates Rails Models, routes, fixtures, and others based on the database schema. (http://github.com/ctran/annotate_models)
  gem "annotate"

  # Brakeman detects security vulnerabilities in Ruby on Rails applications via static analysis. (https://github.com/presidentbeef/brakeman)
  gem "brakeman", "~> 5.2", ">= 5.2.3"

  # Add comments to your Gemfile with each dependency's description. (https://github.com/ivantsepp/annotate_gem)
  gem "annotate_gem", require: false

  # Listen to file modifications (https://github.com/guard/listen)
  gem "listen", "~> 3.3"

  # Git hook manager (https://github.com/sds/overcommit)
  gem "overcommit"

  # Automatic performance checking tool for Ruby code. (https://github.com/rubocop/rubocop-performance)
  gem "rubocop-performance", require: false

  # Automatic Rails code style checking tool. (https://github.com/rubocop/rubocop-rails)
  gem "rubocop-rails", require: false

  # Code style checking for RSpec files (https://github.com/rubocop/rubocop-rspec)
  gem "rubocop-rspec", require: false

  # Rails application preloader (https://github.com/rails/spring)
  gem "spring"

  # A debugging tool for your Ruby on Rails applications. (https://github.com/rails/web-console)
  gem "web-console", ">= 4.1.0"
end

group :test do
  # Capybara aims to simplify the process of integration testing Rack applications, such as Rails, Sinatra or Merb (https://github.com/teamcapybara/capybara)
  gem "capybara", ">= 3.26"

  # RSpec for Rails (https://github.com/rspec/rspec-rails)
  gem "rspec-rails"

  # The next generation developer focused tool for automated testing of webapps (https://github.com/SeleniumHQ/selenium)
  gem "selenium-webdriver"

  # Simple one-liner tests for common Rails functionality (https://matchers.shoulda.io/)
  gem "shoulda-matchers"

  # Code coverage for Ruby (https://github.com/simplecov-ruby/simplecov)
  gem "simplecov", require: false

  # Easy download and use of browser drivers. (https://github.com/titusfortner/webdrivers)
  gem "webdrivers"
end

# Timezone Data for TZInfo (https://tzinfo.github.io)
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
