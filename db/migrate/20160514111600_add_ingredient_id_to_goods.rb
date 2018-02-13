class AddIngredientIdToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column(:goods, :ingredient_id, :integer)
    add_index(:goods, :ingredient_id)
  end
end
