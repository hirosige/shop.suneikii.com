class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :country_id
      t.integer :province_id
      t.integer :district_id
      t.integer :sub_district_id
      t.string :first_name
      t.string :last_name
      t.string :postal_code
      t.text :address1
      t.text :address2
      t.string :tel
      t.string :email
      t.string :photo

      t.timestamps null: false
    end
  end
end
