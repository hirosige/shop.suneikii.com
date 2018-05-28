# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :ingredient do |ingredient|
    ingredient.trait :shrimp do |item|
      item.name "shrimp"
    end

    ingredient.trait :milk do |item|
      item.name "milk"
    end

    ingredient.trait :blank_name do |item|
      item.name ""
    end

    ingredient.trait :name_is_too_long do |item|
      too_long_name = "M" * 256
      item.name too_long_name
    end

    ingredient.trait :unique_chk_fail do |item|
      item.name 'test'
    end

    ingredient.trait :unique_chk_success do |item|
      item.name 'test2'
    end
  end
end
