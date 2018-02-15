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
  factory :color_selection do
    color_id 1
    good_id 1
  end
end
