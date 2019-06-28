Types::Broadcaster::SubscriptionType = GraphQL::ObjectType.define do
  name Broadcaster.configuration.graphql_broadcaster_subscription_name
  description 'A broadcaster subscription'

  field :uuid,
        !types.String,
        'A unique identifier for the broadcaster subscription'

  field :campaign,
        !Types::Broadcaster::CampaignType,
        'The broadcaster campaign of the subscription',
        property: :broadcaster_campaign

  field :active, !types.Boolean, 'Is the subscription active?'
end
