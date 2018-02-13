class AddColorIdToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column(:goods, :color_id, :integer)
    add_index(:goods, :color_id)
  end
end
