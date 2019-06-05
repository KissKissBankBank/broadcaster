module SubscriptionsBroker
  class Subscription
    belongs_to :subscriber
    belongs_to :publisher

    before_create :generate_token

    validates :subscriber_id, :publisher_id, presence: true

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
      self.unsubscribe_token = Devise.friendly_token
    end
  end
end
