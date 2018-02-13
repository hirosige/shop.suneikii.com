class CreateTimelines < ActiveRecord::Migration[5.0]
  def change
    create_table :timelines do |t|
      t.integer :order_id
      t.integer :user_id
      t.integer :message_id

      t.timestamps null: false
    end
  end
end
