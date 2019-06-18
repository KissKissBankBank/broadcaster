module Broadcaster
  module ActsAsSubscriber
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def acts_as_subscriber
        has_many :subscriptions,
                 class_name: 'Broadcaster::Subscription',
                 as: :subscriber
      end
    end
  end
end
