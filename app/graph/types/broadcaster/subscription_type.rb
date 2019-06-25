module Broadcaster
  SubscriptionType = GraphQL::ObjectType.define do
    name Broadcaster.configuration.graphql_broadcaster_subscription_name ||
         'Subscription'
    description 'A broadcaster subscription'

    field :campaign,
          !CampaignType,
          'The broadcaster campaign of the subscription'

    field :subscriber, !Subscriber, 'The subscriber'

    field :active, !types.Boolean, 'Is the subscription active?'
  end
end
