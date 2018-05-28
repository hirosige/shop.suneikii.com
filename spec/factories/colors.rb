# == Schema Information
#
# Table name: colors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :color do |color|
    color.trait :white do |item|
      item.name 'White'
    end

    color.trait :blank_name do |item|
      item.name ''
    end

    color.trait :name_is_too_long do |item|
      too_long_name = "M" * 256
      item.name too_long_name
    end

    color.trait :unique_chk_fail do |item|
      item.name "White"
    end

    color.trait :unique_chk_success do |item|
      item.name "Milky White"
    end
  end
end
