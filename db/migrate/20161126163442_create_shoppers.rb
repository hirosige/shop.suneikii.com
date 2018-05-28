class CreateShoppers < ActiveRecord::Migration[5.0]
  def change
    create_table :shoppers do |t|
      t.string :name
      t.string :photo
      t.string :representative_name
      t.string :postal_code
      t.text :address
      t.string :tel1
      t.string :tel2
      t.string :email
      t.integer :status
      t.text :memo

      t.timestamps null: false
    end
  end
end
