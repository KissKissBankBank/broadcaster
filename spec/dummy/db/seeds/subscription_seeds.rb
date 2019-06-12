subscriber_1 = User.where(email: 'subscriber_1@email.com').first
subscriber_2 = User.where(email: 'subscriber_2@email.com').first
campaign_1 = Broadcaster::Campaign.first
campaign_2 = Broadcaster::Campaign.second

subscription_data = [
  {
    broadcaster_campaign_id: campaign_1.id,
    subscriber_id: subscriber_1.id,
    subscriber_type: 'User',
    active: true,
  },
  {
    broadcaster_campaign_id: campaign_1.id,
    subscriber_id: subscriber_2.id,
    subscriber_type: 'User',
    active: true,
  },
  {
    broadcaster_campaign_id: campaign_2.id,
    subscriber_id: subscriber_1.id,
    subscriber_type: 'User',
    active: false,
  },
  {
    broadcaster_campaign_id: campaign_2.id,
    subscriber_id: subscriber_2.id,
    subscriber_type: 'User',
    active: true,
  },
]

subscription_data.each do |subscription_params|
  next if Broadcaster::Subscription.where(
    broadcaster_campaign_id: subscription_params[:broadcaster_campaign_id],
    subscriber_id: subscription_params[:subscriber_id],
  ).any?

  puts "Subscription #{subscription_params[:broadcaster_campaign_id]}"

  Broadcaster::Subscription.create(**subscription_params)
end
