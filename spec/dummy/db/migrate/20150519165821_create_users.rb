class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, uniqueness: true

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
