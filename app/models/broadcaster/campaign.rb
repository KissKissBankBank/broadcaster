module Broadcaster
  class Campaign < ActiveRecord::Base
    include Broadcaster::Identifiable

    belongs_to :publisher, polymorphic: true
    has_many :broadcaster_subscriptions,
             dependent: :destroy,
             class_name: '::Broadcaster::Subscription',
             foreign_key: :broadcaster_campaign_id

    def active_broadcaster_subscriptions
      subscriptions.active
    end
  end
end
