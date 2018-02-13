# == Schema Information
#
# Table name: good_images
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :good_image do
    image "MyString"
    good_id 1
  end
end
