Types::Broadcaster::CampaignType = GraphQL::ObjectType.define do
  name Broadcaster.configuration.graphql_broadcaster_campaign_name
  description 'A broadcaster publication campaign'

  field :uuid, !types.ID, 'A unique identifier for the broadcaster campaign'

  field :subscriptions,
        !types[!Types::Broadcaster::SubscriptionType],
        'The campaign subscriptions',
        property: :broadcaster_subscriptions

  field :label, !types.String, 'The campaign label'

  field :subscriptionsCount do
    type !types.Int
    description 'The number of subscriptions for this campaign'
    resolve ->(obj, _args, _ctx) do
      obj.broadcaster_subscriptions.count
    end
  end
end
