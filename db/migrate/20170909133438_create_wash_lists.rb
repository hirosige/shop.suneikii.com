class CreateWashLists < ActiveRecord::Migration
  def change
    create_table :wash_lists do |t|
      t.integer :user_id
      t.integer :good_id

      t.timestamps null: false
    end
  end
end
