# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :size do |size|
    size.trait :s do |item|
      item.name "S"
    end

    size.trait :m do |item|
      item.name "M"
    end

    size.trait :l do |item|
      item.name "L"
    end

    size.trait :empty do |item|
      item.name ""
    end

    size.trait :name_255 do |item|
      item.name "M" * 256
    end
  end
end
