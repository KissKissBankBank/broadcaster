Types::Broadcaster::CampaignType = GraphQL::ObjectType.define do
  name Broadcaster.configuration.graphql_broadcaster_campaign_name ||
       'Campaign'
  description 'A broadcaster publication campaign'

  field :uuid, !types.String, 'A unique identifier for the broadcaster campaign'

  field :broadcaster_subscriptions,
        !types[!Types::Broadcaster::SubscriptionType],
        'The campaign subscriptions'

  field :label, !types.String, 'The campaign label'
end
