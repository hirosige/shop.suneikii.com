# == Schema Information
#
# Table name: wish_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :wish_list do |wish_list|
    wish_list.trait :one do |item|
      item.association :good, factory: %i[good a]
      item.association :user, factory: %i[user user3]
    end

    wish_list.trait :two do |item|
      item.user_id 1
      item.good_id 1
    end

    wish_list.trait :user_nil do |item|
      item.association :good, factory: %i[good a]
    end

    wish_list.trait :good_nil do |item|
      item.association :user, factory: %i[user user3]
    end
  end
end
