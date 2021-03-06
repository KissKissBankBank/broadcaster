Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'a user, acting both as a subscriber and publisher'

  field :id, types.Int, 'The user id'
  field :campaigns,
        types[!Types::Broadcaster::CampaignType],
        'The publication campaigns of the user',
        property: :broadcaster_campaigns
  field :subscriptions,
        types[!Types::Broadcaster::SubscriptionType],
        'The subscriptions of the user',
        property: :broadcaster_subscriptions
end
