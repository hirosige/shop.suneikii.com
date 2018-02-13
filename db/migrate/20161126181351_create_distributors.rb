class CreateDistributors < ActiveRecord::Migration[5.0]
  def change
    create_table :distributors do |t|
      t.string :name
      t.string :tel
      t.string :address

      t.timestamps null: false
    end
  end
end
