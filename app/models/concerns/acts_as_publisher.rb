module Broadcaster
  module ActsAsPublisher
    extend ActiveSupport::Concern

    included do
      has_many :publication_campaigns,
               class_name: 'Broadcaster::Campaign',
               as: :publisher
    end
  end
end
