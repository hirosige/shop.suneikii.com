class RemoveColumnsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :order_id, :string
  end
end
