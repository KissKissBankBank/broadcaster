module Broadcaster
  class CreateSubscription
    include Interactor
    include Interactor::Contract

    input :subscriber
    input :broadcaster_campaign

    def call
      Broadcaster::Subscription.create!(
        subscriber: subscriber,
        broadcaster_campaign: broadcaster_campaign,
      )
    end

    delegate :subscriber, :broadcaster_campaign, to: :context
  end
end
