# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  good_id     :integer
#  rates       :decimal(2, 1)
#  description :text(65535)
#  status      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :rating do
    user_id 1
    good_id 1
    rates "9.99"
    description "MyText"
    status "MyString"
  end
end
