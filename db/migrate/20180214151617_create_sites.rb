class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :email
      t.string :tel1
      t.string :tel2
      t.text :address
      t.text :privacy_policy
      t.text :condition_of_use

      t.timestamps
    end
  end
end
