class CreateSizeSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :size_selections do |t|
      t.integer :size_id
      t.integer :good_id

      t.timestamps
    end
  end
end
