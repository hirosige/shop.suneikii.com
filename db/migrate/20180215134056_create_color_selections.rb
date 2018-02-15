class CreateColorSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :color_selections do |t|
      t.integer :color_id
      t.integer :good_id

      t.timestamps
    end
  end
end
