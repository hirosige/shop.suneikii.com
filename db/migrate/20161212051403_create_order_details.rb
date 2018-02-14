class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :good_id
      t.integer :qty
      t.decimal :sub_total, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
