class CreatePolicies < ActiveRecord::Migration[5.0]
  def change
    create_table :policies do |t|
      t.string :title
      t.string :sub_title
      t.text :description
      t.string :category

      t.timestamps null: false
    end
  end
end
