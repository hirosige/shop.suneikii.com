# == Schema Information
#
# Table name: carts
#
#  id           :integer          not null, primary key
#  total_amount :decimal(16, 3)
#  status       :string(255)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :cart do |cart|
    cart.trait :one do |item|
      item.total_amount 0.0
      item.association :user, factory: %i[user user1]
    end

    cart.trait :my_cart do |item|
      item.total_amount 0.0
      item.association :user, factory: %i[user me]
    end

    cart.trait :blank_user do |item|
      item.total_amount 0.0
    end
  end
end
