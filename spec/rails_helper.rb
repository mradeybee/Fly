ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require "capybara/rspec"
require "capybara/rails"
require "database_cleaner"

Dir[Rails.root.join('spec/support/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.render_views
  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each, js: true) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
  
  config.infer_spec_type_from_file_location!
end