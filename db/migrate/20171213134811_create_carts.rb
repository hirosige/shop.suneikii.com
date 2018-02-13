class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.decimal :total_amount, precision: 16, scale: 3
      t.string :status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
