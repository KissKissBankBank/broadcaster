require 'rails'
require 'active_support/core_ext'
require 'broadcaster/configuration'

module Broadcaster
  class Engine < ::Rails::Engine
    isolate_namespace Broadcaster

    # https://content.pivotal.io/blog/leave-your-migrations-in-your-rails-engines
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end
  end
end
