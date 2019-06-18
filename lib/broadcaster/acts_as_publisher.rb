module Broadcaster
  module ActsAsPublisher
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def acts_as_publisher
        has_many :publication_campaigns,
                 class_name: 'Broadcaster::Campaign',
                 as: :publisher
      end
    end
  end
end
