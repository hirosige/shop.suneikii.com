class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.integer :payment_method_id
      t.string :evidence
      t.datetime :paid_at

      t.timestamps
    end
  end
end
