class AddGenderIdToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column(:goods, :gender_id, :integer)
    add_index(:goods, :gender_id)
  end
end
