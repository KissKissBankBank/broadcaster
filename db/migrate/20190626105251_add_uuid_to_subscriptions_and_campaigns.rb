class AddUuidToSubscriptionsAndCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :broadcaster_campaigns, :uuid, :string
    add_column :broadcaster_subscriptions, :uuid, :string
  end
end
