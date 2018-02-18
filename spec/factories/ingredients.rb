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
  end
end
