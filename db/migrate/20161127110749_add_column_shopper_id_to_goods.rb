class AddColumnShopperIdToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column(:goods, :shopper_id, :integer)
  end
end
