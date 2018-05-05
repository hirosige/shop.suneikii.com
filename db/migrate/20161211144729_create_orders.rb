class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :ordered_at
      t.integer :user_id
      t.string :payment_status
      t.string :fulfillment_status
      t.decimal :total_amount, precision: 10, scale: 2
      t.decimal :shipping_cost, precision: 10, scale: 2
      t.decimal :tax, precision: 5, scale: 2
      t.text :note
      t.string :tracking_no

      t.timestamps null: false
    end
  end
end
