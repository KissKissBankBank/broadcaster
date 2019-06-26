ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('dummy/config/environment', __dir__)

require 'spec_helper'

require 'rspec/rails'
require 'factory_bot_rails'
require 'support/graphql_helper'

ActiveRecord::Migration.try(:maintain_test_schema!)

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include GraphQLHelpers, type: :graphql_type
end
