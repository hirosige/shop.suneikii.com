# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  good_id    :integer
#  pts        :integer
#  sub_amount :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :order_detail do |order_detail|
    order_detail.trait :good_a_three do |item|
      item.association :order, factory: %i[order good_a]
      item.association :good, factory: %i[good a]
      item.pts 3
      item.sub_amount 0.00
    end

    order_detail.trait :good_b_two do |item|
      item.association :order, factory: %i[order good_a]
      item.association :good, factory: %i[good b]
      item.pts 3
      item.sub_amount 0.00
    end
  end
end
