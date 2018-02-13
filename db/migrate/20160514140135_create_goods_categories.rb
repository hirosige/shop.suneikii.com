class CreateGoodsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :goods_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
