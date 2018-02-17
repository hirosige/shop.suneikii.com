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
  end
end
