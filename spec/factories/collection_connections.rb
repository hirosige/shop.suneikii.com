# == Schema Information
#
# Table name: collection_connections
#
#  id            :integer          not null, primary key
#  collection_id :integer
#  good_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :collection_connection do
    collection_id 1
    good_id 1
  end
end
