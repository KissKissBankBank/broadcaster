require 'broadcaster/version'
require 'broadcaster/engine'
require 'broadcaster/configuration'

module Broadcaster
  class Error < StandardError; end

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
