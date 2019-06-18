module Broadcaster
  module ActsAsSubscriber
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def acts_as_broadcaster_subscriber
        has_many :broadcaster_subscriptions,
                 class_name: 'Broadcaster::Subscription',
                 as: :subscriber
      end
    end
  end
end
