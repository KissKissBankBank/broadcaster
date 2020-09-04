require 'rails'
require 'interactor'
require 'graphql'
require 'active_support/core_ext'
require 'broadcaster/configuration'
require 'broadcaster/acts_as_subscriber'
require 'broadcaster/acts_as_publisher'
require 'broadcaster/identifiable'
require 'tote_bag'

ActiveSupport.on_load :active_record do
  ActiveRecord::Base.include Broadcaster::ActsAsPublisher
  ActiveRecord::Base.include Broadcaster::ActsAsSubscriber
end

module Broadcaster
  class Engine < ::Rails::Engine
    isolate_namespace Broadcaster

    initializer :append_migrations do |app|
      ToteBag::Migration.export(app, config, root)
    end
  end
end
