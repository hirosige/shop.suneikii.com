class AddColumnToOrderDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :order_details, :order_id, :integer
  end
end
