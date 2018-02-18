# == Schema Information
#
# Table name: allegic_contents
#
#  id            :integer          not null, primary key
#  ingredient_id :integer
#  good_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :allergic_content do |ingredient|
    ingredient.trait :a_shrimp do |item|
      item.association :ingredient, factory: %i[ingredient shrimp]
      item.association :good, factory: %i[good a]
    end

    ingredient.trait :a_milk do |item|
      item.association :ingredient, factory: %i[ingredient milk]
      item.association :good, factory: %i[good a]
    end

    ingredient.trait :ingredient_nil do |item|
      item.association :good, factory: %i[good a]
    end

    ingredient.trait :good_nil do |item|
      item.association :ingredient, factory: %i[ingredient milk]
    end
  end
end
