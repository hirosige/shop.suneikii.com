# == Schema Information
#
# Table name: profiles
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  country_id      :integer
#  province_id     :integer
#  district_id     :integer
#  sub_district_id :integer
#  first_name      :string(255)
#  last_name       :string(255)
#  postal_code     :string(255)
#  address1        :text(65535)
#  address2        :text(65535)
#  tel             :string(255)
#  email           :string(255)
#  photo           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :profile do
    postal_code "MyString"
    address "MyText"
    tel "MyString"
    reciever_email "MyString"
    user_id 1
  end
end
