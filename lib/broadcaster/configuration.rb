require 'yaml'
# Configuration variables and defaults
module Broadcaster
  class Configuration
    attr_accessor :graphql_broadcaster_campaign_name,
                  :graphql_broadcaster_subscription_name

    def initialize
      @graphql_broadcaster_campaign_name = 'Campaign'
      @graphql_broadcaster_subscription_name = 'Subscription'
    end
  end
end
