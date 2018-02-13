class AddColumnToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column :goods, :status, :string
  end
end
