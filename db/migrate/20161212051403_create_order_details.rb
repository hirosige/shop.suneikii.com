class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
