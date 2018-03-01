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
  factory :collection_connection do |collection_connection|
    collection_connection.trait :summer_collection_a do |item|
      item.association :collection, factory: %i[collection summer_collection]
      item.association :good, factory: %i[good a]
    end

    collection_connection.trait :blank_collection do |item|
      item.association :good, factory: %i[good a]
    end

    collection_connection.trait :blank_good do |item|
      item.association :collection, factory: %i[collection summer_collection]
    end
  end
end
