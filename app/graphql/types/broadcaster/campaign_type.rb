Types::Broadcaster::CampaignType = GraphQL::ObjectType.define do
  name Broadcaster.configuration.graphql_broadcaster_campaign_name
  description 'A broadcaster publication campaign'

  field :uuid, !types.String, 'A unique identifier for the broadcaster campaign'

  field :subscriptions,
        !types[!Types::Broadcaster::SubscriptionType],
        'The campaign subscriptions',
        property: :broadcaster_subscriptions

  field :label, !types.String, 'The campaign label'
end
