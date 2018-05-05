# == Schema Information
#
# Table name: cart_contents
#
#  id         :integer          not null, primary key
#  good_id    :integer
#  pts        :integer
#  sub_amount :decimal(16, 3)
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :cart_content do |cart_content|
    cart_content.trait :buy_a_one_in_my_cart do |item|
      item.association :good, factory: %i[good a]
      item.pts 1
      item.sub_amount 100.0
      item.association :cart, factory: %i[cart my_cart]
    end

    cart_content.trait :buy_a_three_in_my_cart do |item|
      item.association :good, factory: %i[good a]
      item.pts 3
      item.sub_amount 0.0
      item.association :cart, factory: %i[cart my_cart]
    end

    cart_content.trait :copy_ex1 do |item|
      item.association :good, factory: %i[good a]
      item.pts 3
      item.sub_amount 100.0
      item.association :cart, factory: %i[cart my_cart]
    end

    cart_content.trait :copy_ex2 do |item|
      item.association :good, factory: %i[good b]
      item.pts 3
      item.sub_amount 0.0
      item.association :cart, factory: %i[cart my_cart]
    end

    cart_content.trait :blank_good do |item|
      item.pts 3
      item.sub_amount 0.0
      item.association :cart, factory: %i[cart my_cart]
    end

    cart_content.trait :blank_pts do |item|
      item.association :good, factory: %i[good a]
      item.sub_amount 0.0
      item.association :cart, factory: %i[cart my_cart]
    end

    cart_content.trait :blank_sub_amount do |item|
      item.association :good, factory: %i[good a]
      item.pts 3
      item.association :cart, factory: %i[cart my_cart]
    end

    cart_content.trait :blank_cart do |item|
      item.association :good, factory: %i[good a]
      item.pts 3
      item.sub_amount 0.0
    end

    cart_content.trait :pts_is_zero do |item|
      item.association :good, factory: %i[good a]
      item.pts 0
      item.sub_amount 100.0
      item.association :cart, factory: %i[cart my_cart]
    end

    cart_content.trait :unique_chk_fail do |item|
      item.association :good, factory: %i[good a]
      item.pts 1
      item.sub_amount 100.0
      item.association :cart, factory: %i[cart my_cart]
    end
  end
end
