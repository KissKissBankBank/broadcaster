require 'yaml'
# Configuration variables and defaults
module Broadcaster
  class Configuration
    attr_accessor :graphql_broadcaster_campaign_name,
                  :graphql_broadcaster_subscription_name

    def initialize
      @graphql_broadcaster_campaign_name = nil
      @graphql_broadcaster_subscription_name = nil
    end
  end
end
