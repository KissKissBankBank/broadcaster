class AddIndexToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_index :broadcaster_subscriptions,
              %i[subscriber_id subscriber_type broadcaster_campaign_id],
              unique: true,
              name: :index_broadcaster_subscriptions_on_subscriber_campaign
  end
end
