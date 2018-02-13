class AddRoleToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :string, default: :customer, null: false
  end
end
