class AddIndexToCampaigns < ActiveRecord::Migration
  def change
    add_index :broadcaster_campaigns,
              %i[publisher_id publisher_type label],
              unique: true,
              name: :index_broadcaster_campaigns_on_publisher_and_label
  end
end
