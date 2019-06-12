module Broadcaster
  class Campaign < ActiveRecord::Base
    belongs_to :publisher, polymorphic: true
    has_many :subscriptions,
             dependent: :destroy,
             class_name: 'Broadcaster::Subscription',
             foreign_key: :broadcaster_campaign_id

    def active_subscriptions
      subscriptions.active
    end
  end
end
