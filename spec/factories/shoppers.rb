# == Schema Information
#
# Table name: shoppers
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  photo               :string(255)
#  representative_name :string(255)
#  postal_code         :string(255)
#  address             :text(65535)
#  tel1                :string(255)
#  tel2                :string(255)
#  email               :string(255)
#  status              :integer
#  memo                :text(65535)
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryBot.define do
  factory :shopper do |shopper|
    shopper.trait :a do |item|
      item.name "shopper_a"
      item.photo "test"
      item.representative_name "test"
      item.postal_code "test"
      item.address "test"
      item.tel1 5354345
      item.tel2 5345345
      item.email "test"
      item.memo "test"
      item.user_id 1
    end
  end
end
