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
  factory :size_selection do
    size_id 1
    good_id 1
  end
end
