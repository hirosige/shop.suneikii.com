class CreateCartContents < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_contents do |t|
      t.integer :good_id
      t.integer :pts
      t.decimal :sub_amount, precision: 16, scale: 3
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
