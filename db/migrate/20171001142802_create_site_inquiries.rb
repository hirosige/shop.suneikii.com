class CreateSiteInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :site_inquiries do |t|
      t.string :name
      t.string :email
      t.text :body

      t.timestamps null: false
    end
  end
end
