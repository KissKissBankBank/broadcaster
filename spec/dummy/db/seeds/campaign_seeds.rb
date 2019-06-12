publisher_1 = User.where(email: 'publisher_1@email.com').first
publisher_2 = User.where(email: 'publisher_2@email.com').first

campaigns_data = [
  {
    label: 'test',
    publisher_id: publisher_1.id,
    publisher_type: 'User',
  },
  {
    label: 'post_launch',
    publisher_id: publisher_1.id,
    publisher_type: 'User',
  },
  {
    label: 'regular_updates',
    publisher_id: publisher_2.id,
    publisher_type: 'User',
  },
]

campaigns_data.each do |campaign_data|
  next if Broadcaster::Campaign.where(label: campaign_data[:label]).any?

  puts "Campaign #{campaign_data[:label]}"

  Broadcaster::Campaign.create(**campaign_data)
end
