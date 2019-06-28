class AddUuidToSubscriptionsAndCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :broadcaster_campaigns, :uuid, :string
    add_column :broadcaster_subscriptions, :uuid, :string

    add_index :broadcaster_campaigns, :uuid, unique: true
    add_index :broadcaster_subscriptions, :uuid, unique: true
  end
end
