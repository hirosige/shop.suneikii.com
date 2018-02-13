class CreateGoodImages < ActiveRecord::Migration[5.1]
  def change
    create_table :good_images do |t|
      t.string :image
      t.integer :good_id

      t.timestamps
    end
  end
end
