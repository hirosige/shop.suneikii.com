class AddGoodsCategoryIdToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column(:goods, :goods_category_id, :integer)
    add_index(:goods, :goods_category_id)
  end
end
