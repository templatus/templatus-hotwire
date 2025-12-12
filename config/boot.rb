ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.

# Keyword-argument compatibility for connection_pool must be applied before Rails boots.
require_relative 'initializers/connection_pool_kwargs'
