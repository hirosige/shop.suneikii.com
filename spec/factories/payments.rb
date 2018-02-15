# == Schema Information
#
# Table name: payments
#
#  id                :integer          not null, primary key
#  order_id          :integer
#  payment_method_id :integer
#  evidence          :string(255)
#  paid_at           :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :payment do
    order_id 1
    payment_method_id 1
    evidence "MyString"
    paid_at "2018-02-14 15:20:39"
  end
end
