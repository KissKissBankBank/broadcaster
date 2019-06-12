class CreateBroadcasterCampaigns < ActiveRecord::Migration
  def up
    create_table :broadcaster_campaigns do |t|
      t.references :publisher, polymorphic: true, index: true
      t.string :label

      t.timestamps
    end
  end

  def down
    drop_table :broadcaster_campaigns
  end
end
