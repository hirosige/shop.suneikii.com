# == Schema Information
#
# Table name: collections
#
#  id            :integer          not null, primary key
#  start_at      :datetime
#  end_at        :datetime
#  discount_rate :decimal(5, 2)
#  status        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :collection do
    start_at "2018-02-14 15:14:47"
    end_at "2018-02-14 15:14:47"
    discount_rate "9.99"
    status "MyString"
  end
end
