class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.integer :shopper_id
      t.integer :goods_category_id
      t.string :name
      t.string :thumbnail
      t.decimal :price, precision: 10, scale: 2
      t.string :description
      t.integer :gender
      t.text :admin_memo
      t.string :status

      t.timestamps null: false
    end
  end
end
