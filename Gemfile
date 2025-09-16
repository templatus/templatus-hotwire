source 'https://rubygems.org'

ruby file: '.ruby-version'

# Full-stack web application framework. (https://rubyonrails.org)
gem 'rails', '~> 8.0.0'

# Use Vite in Rails and bring joy to your JavaScript experience (https://github.com/ElMassimo/vite_ruby)
gem 'vite_rails'

# The speed of a single-page web application without having to write any JavaScript. (https://github.com/hotwired/turbo-rails)
gem 'turbo-rails'

# A modest JavaScript framework for the HTML you already have. (https://stimulus.hotwired.dev)
gem 'stimulus-rails'

# A framework for building reusable, testable & encapsulated view components in Ruby on Rails. (https://viewcomponent.org)
gem 'view_component'

# Pg is the Ruby interface to the PostgreSQL RDBMS (https://github.com/ged/ruby-pg)
gem 'pg', '~> 1.1'

# A Ruby/Rack web server built for parallelism. (https://puma.io)
gem 'puma', '>= 5.0'

# Boot large ruby/rails apps faster (https://github.com/Shopify/bootsnap)
gem 'bootsnap', '>= 1.4.4', require: false

# Timezone Data for TZInfo (https://tzinfo.github.io)
gem 'tzinfo-data', platforms: %i[windows jruby]

# A Ruby client library for Redis (https://github.com/redis/redis-rb)
gem 'redis', '>= 4.0.1'

# Tame Rails' multi-line logging into a single line per request (https://github.com/roidrage/lograge)
gem 'lograge'

# Middleware for enabling Cross-Origin Resource Sharing in Rack apps (https://github.com/cyu/rack-cors)
gem 'rack-cors', require: 'rack/cors'

# Rack middleware for defining a canonical host name. (https://github.com/tylerhunt/rack-canonical-host)
gem 'rack-canonical-host'

# Brotli compression for Rack responses (http://github.com/marcotc/rack-brotli/)
gem 'rack-brotli'

# Simple, efficient background processing for Ruby (https://sidekiq.org)
gem 'sidekiq'

# Lock staging servers from search engines and prying eyes. (http://lockup.interdiscipline.com)
gem 'lockup', github: 'interdiscipline/lockup'

# Ruby on Rails applications monitoring (https://www.rorvswild.com)
gem 'rorvswild'

# Class to build custom data structures, similar to a Hash. (https://github.com/ruby/ostruct)
gem 'ostruct'

group :development, :test do
  # Debugging functionality for Ruby (https://github.com/ruby/debug)
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  # Security vulnerability scanner for Ruby on Rails. (https://brakemanscanner.org)
  gem 'brakeman', require: false

  # Loads environment variables from `.env`. (https://github.com/bkeepers/dotenv)
  gem 'dotenv'

  # RSpec for Rails (https://github.com/rspec/rspec-rails)
  gem 'rspec-rails'

  # factory_bot_rails provides integration between factory_bot and Rails 6.1 or newer (https://github.com/thoughtbot/factory_bot_rails)
  gem 'factory_bot_rails'

  # Automatic Ruby code style checking tool. (https://github.com/rubocop/rubocop)
  gem 'rubocop', require: false

  # Automatic performance checking tool for Ruby code. (https://github.com/rubocop/rubocop-performance)
  gem 'rubocop-performance', require: false

  # Automatic Rails code style checking tool. (https://github.com/rubocop/rubocop-rails)
  gem 'rubocop-rails', require: false

  # Code style checking for RSpec files (https://github.com/rubocop/rubocop-rspec)
  gem 'rubocop-rspec', require: false

  # Code style checking for RSpec Rails files (https://github.com/rubocop/rubocop-rspec_rails)
  gem 'rubocop-rspec_rails', require: false

  # Code style checking for Capybara test files (https://github.com/rubocop/rubocop-capybara)
  gem 'rubocop-capybara', require: false

  # Code style checking for factory_bot files (https://github.com/rubocop/rubocop-factory_bot)
  gem 'rubocop-factory_bot', require: false

  # An XML toolkit for Ruby (https://github.com/ruby/rexml)
  gem 'rexml'
end

group :development do
  # A debugging tool for your Ruby on Rails applications. (https://github.com/rails/web-console)
  gem 'web-console', '>= 4.1.0'

  # Listen to file modifications (https://github.com/guard/listen)
  gem 'listen', '~> 3.3'

  # Guard gem for RSpec (https://github.com/guard/guard-rspec)
  gem 'guard-rspec', require: false

  # Lookbook is a UI development environment for Ruby on Rails applications (https://github.com/lookbook-hq/lookbook)
  gem 'lookbook'

  # A gem for generating annotations for Rails projects. (https://github.com/drwl/annotaterb)
  gem 'annotaterb'

  # Pretty print Ruby objects with proper indentation and colors (https://github.com/amazing-print/amazing_print)
  gem 'amazing_print'

  # ERB lint tool (https://github.com/Shopify/erb_lint)
  gem 'erb_lint', require: false
end

group :test do
  # Code coverage for Ruby (https://github.com/simplecov-ruby/simplecov)
  gem 'simplecov', require: false

  # Capybara aims to simplify the process of integration testing Rack applications, such as Rails, Sinatra or Merb (https://github.com/teamcapybara/capybara)
  gem 'capybara'
end

group :production do
  # Full-stack error tracking, performance monitoring, logging, and more. (https://www.honeybadger.io/for/ruby/)
  gem 'honeybadger'
end
