# == Schema Information
#
# Table name: color_selections
#
#  id         :integer          not null, primary key
#  color_id   :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :color_selection do |color_selection|
    color_selection.trait :a_white do |item|
      item.association :color, factory: %i[color white]
      item.association :good, factory: %i[good a]
    end

    color_selection.trait :blank_color do |item|
      item.association :good, factory: %i[good a]
    end

    color_selection.trait :blank_good do |item|
      item.association :color, factory: %i[color white]
    end
  end
end
