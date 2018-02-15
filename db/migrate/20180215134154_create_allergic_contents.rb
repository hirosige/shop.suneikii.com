class CreateAllergicContents < ActiveRecord::Migration[5.1]
  def change
    create_table :allergic_contents do |t|
      t.integer :ingredient_id
      t.integer :good_id

      t.timestamps
    end
  end
end
