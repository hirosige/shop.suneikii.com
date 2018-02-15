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
  factory :allegic_content do
    ingredient_id 1
    good_id 1
  end
end
