class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :good_id
      t.decimal :rates, precision: 2, scale: 1
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
