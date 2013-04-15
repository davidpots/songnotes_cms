ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'


DatabaseCleaner.clean_with :truncation
# DatabaseCleaner[:active_record].strategy = :transaction
DatabaseCleaner[:active_record].strategy = :truncation

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  setup do
    if ENV["VERBOSE"].present?
      puts self.name
    end
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end

  # Add more helper methods to be used by all tests here...
end
