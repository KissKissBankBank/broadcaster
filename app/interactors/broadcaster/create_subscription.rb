module Broadcaster
  class CreateSubscription
    include Interactor

    def call
      Broadcaster::Subscription.create!(
        subscriber: subscriber,
        broadcaster_campaign: broadcaster_campaign,
      )
    end

    delegate :subscriber, :broadcaster_campaign, to: :context
  end
end
