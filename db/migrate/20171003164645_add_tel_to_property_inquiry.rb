class AddTelToPropertyInquiry < ActiveRecord::Migration[5.0]
  def change
    add_column :property_inquiries, :tel, :string
  end
end
