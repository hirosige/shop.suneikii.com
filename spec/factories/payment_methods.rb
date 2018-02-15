# == Schema Information
#
# Table name: payment_methods
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  account_number :integer
#  account_name   :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :payment_method do
    name "MyString"
    account_number 1
    account_name "MyString"
  end
end
