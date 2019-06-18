module Broadcaster
  class Subscription < ActiveRecord::Base
    belongs_to :subscriber, polymorphic: true
    belongs_to :broadcaster_campaign,
               class_name: '::Broadcaster::Campaign',
               foreign_key: :broadcaster_campaign_id

    scope :active, -> { where(active: true) }

    before_create :generate_token

    validates :subscriber_id, :broadcaster_campaign_id, presence: true

    def activate
      update_attribute :active, true
    end

    def deactivate
      self.active = false
      generate_token
      save!
    end

    private

    def generate_token
      self.unsubscribe_token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless
          self.class.exists?(unsubscribe_token: random_token)
      end
    end
  end
end
