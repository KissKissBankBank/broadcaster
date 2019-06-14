module Broadcaster
  class Subscription < ActiveRecord::Base
    include Broadcaster::Tokenable

    belongs_to :subscriber, polymorphic: true
    belongs_to :broadcaster_campaign,
               class_name: 'Broadcaster::Campaign',
               foreign_key: :broadcaster_campaign_id

    scope :active, -> { where(active: true) }

    validates :subscriber_id, :broadcaster_campaign_id, presence: true

    def activate
      update_attribute :active, true
    end

    def deactivate
      self.active = false
      generate_token
      save!
    end
  end
end
