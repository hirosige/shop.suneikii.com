class CreatePaymentMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.integer :account_number
      t.string :account_name

      t.timestamps
    end
  end
end
