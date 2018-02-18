class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.decimal :discount_rate, precision: 5, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
