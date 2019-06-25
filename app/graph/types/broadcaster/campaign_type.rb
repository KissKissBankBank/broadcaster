module Broadcaster
  CampaignType = GraphQL::ObjectType.define do
    name Broadcaster.configuration.graphql_broadcaster_campaign_name ||
         'Campaign'
    description 'A broadcaster publication campaign'

    field :subscriptions,
          !types[!Broadcaster::SubscriptionType],
          'The campaign subscriptions'

    field :publisher, !Publisher

    field :label, !types.String, 'The campaign label'
  end
end
