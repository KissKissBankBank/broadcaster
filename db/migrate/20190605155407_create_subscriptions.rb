class CreateSubscriptions < ActiveRecord::Migration
  def up
    create_table :subscriptions do |t|
      t.references :subscriber, polymorphic: true, index: true
      t.references :publisher, polymorphic: true, index: true
      t.string :unsubscribe_token
      t.string :topic
      t.boolean :active

      t.timestamps
    end
  end

  def down
    drop_table :subscriptions
  end
end
