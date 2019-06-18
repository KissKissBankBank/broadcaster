class CreateBroadcasterSubscriptions < ActiveRecord::Migration
  def up
    create_table :broadcaster_subscriptions do |t|
      t.references :subscriber,
                   polymorphic: true,
                   index: { name: 'index_subscriptions_on_subscriber' }
      t.references :broadcaster_campaign, index: true
      t.string :unsubscribe_token
      t.boolean :active, default: true

      t.timestamps
    end
  end

  def down
    drop_table :broadcaster_subscriptions
  end
end
