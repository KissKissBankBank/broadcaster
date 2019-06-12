require 'yaml'
# Configuration variables and defaults
module Broadcaster
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

  class Configuration
  end
end
