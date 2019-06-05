ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('dummy/config/environment', __dir__)

require 'spec_helper'

require 'rspec/rails'
require 'factory_bot_rails'

ActiveRecord::Migration.try(:maintain_test_schema!)

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end
