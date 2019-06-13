module Broadcaster
  module ActsAsSubscriber
    extend ActiveSupport::Concern

    included do
      has_many :subscriptions,
               class_name: 'Broadcaster::Subscription',
               as: :subscriber
    end
  end
end
