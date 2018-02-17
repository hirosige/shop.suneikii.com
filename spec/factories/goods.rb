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
  factory :good do |good|
    good.trait :a do |item|
      item.goods_category_id 1
      item.name "good_a"
      item.thumbnail "test"
      item.price 2000.0
      item.description "test"
      item.gender 0
      item.admin_memo "test"

      item.association :goods_category, factory: %i[goods_category soap]
      item.association :shopper, factory: %i[shopper a]
    end

    good.trait :b do |item|
      item.goods_category_id 1
      item.name "good_b"
      item.thumbnail "test"
      item.price 3000.0
      item.description "test"
      item.gender 0
      item.admin_memo "test"
    end
  end
end
