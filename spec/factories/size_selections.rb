# == Schema Information
#
# Table name: size_selections
#
#  id         :integer          not null, primary key
#  size_id    :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :size_selection do |size_selection|

    size_selection.trait :a_connection do |item|
      item.association :size, factory: %i[size s]
      item.association :good, factory: %i[good a]
    end

    size_selection.trait :size_nil do |item|
      item.association :good, factory: %i[good a]
    end

    size_selection.trait :good_nil do |item|
      item.association :size, factory: %i[size s]
    end
  end
end
