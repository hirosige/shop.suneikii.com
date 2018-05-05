# == Schema Information
#
# Table name: goods
#
#  id                :integer          not null, primary key
#  shopper_id        :integer
#  goods_category_id :integer
#  name              :string(255)
#  thumbnail         :string(255)
#  price             :decimal(10, 2)
#  description       :string(255)
#  gender            :integer
#  admin_memo        :text(65535)
#  status            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :goods_category do |category|
    category.trait :soap do |item|
      item.name "soap"
    end

    category.trait :towel do |item|
      item.name "towel"
    end

    category.trait :blank_name do |item|
      item.name ""
    end

    category.trait :name_is_too_long do |item|
      too_long_name = "M" * 256
      item.name too_long_name
    end

    category.trait :unique_chk_fail do |item|
      item.name 'test'
    end

    category.trait :unique_chk_success do |item|
      item.name 'test2'
    end
  end
end
