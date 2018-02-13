class CreateUseTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :use_terms do |t|
      t.string :title
      t.string :sub_title
      t.text :description

      t.timestamps null: false
    end
  end
end
