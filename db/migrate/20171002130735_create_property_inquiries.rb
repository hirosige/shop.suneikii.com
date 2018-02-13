class CreatePropertyInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :property_inquiries do |t|
      t.string :name
      t.string :email
      t.text :body
      t.integer :apartment_id
      t.integer :land_id
      t.integer :condominium_id
      t.integer :house_id

      t.timestamps null: false
    end
  end
end
