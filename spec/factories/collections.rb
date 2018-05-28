# == Schema Information
#
# Table name: collections
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  start_at      :datetime
#  end_at        :datetime
#  discount_rate :decimal(5, 2)
#  status        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :collection do |collection|
    collection.trait :summer_collection do |item|
      item.name 'Collection Name'
      item.start_at Time.zone.now
      item.end_at Time.zone.now + 1.days
      item.discount_rate 10
    end

    collection.trait :blank_name do |item|
      item.start_at Time.zone.now
      item.end_at Time.zone.now
      item.discount_rate 10
    end

    collection.trait :blank_start_at do |item|
      item.name 'Collection Name'
      item.end_at Time.zone.now
      item.discount_rate 10
    end

    collection.trait :blank_end_at do |item|
      item.name 'Collection Name'
      item.start_at Time.zone.now
      item.discount_rate 10
    end

    collection.trait :blank_discount_rate do |item|
      item.name 'Collection Name'
      item.start_at Time.zone.now
      item.end_at Time.zone.now
    end

    collection.trait :name_is_too_long do |item|
      too_long_name = "M" * 256
      item.name too_long_name
      item.start_at Time.zone.now
      item.end_at Time.zone.now
      item.discount_rate 10
    end

    collection.trait :invalid_datetime_start_at do |item|
      invalid_start_at = "1999-99-99 99:99"
      item.name 'test'
      item.start_at invalid_start_at
      item.end_at Time.zone.now
      item.discount_rate 10
    end

    collection.trait :invalid_datetime_end_at do |item|
      invalid_end_at = "1999-99-99 99:99"
      item.name 'test'
      item.start_at Time.zone.now
      item.end_at invalid_end_at
      item.discount_rate 10
    end

    collection.trait :string_discount_rate do |item|
      string_discount_rate = "test"
      item.name 'test'
      item.start_at Time.zone.now
      item.end_at Time.zone.now
      item.discount_rate string_discount_rate
    end

    collection.trait :past_start_at do |item|
      past_start_at = "2018-01-01 00:00"
      item.name 'test'
      item.start_at past_start_at
      item.end_at Time.zone.now
      item.discount_rate 10.0
    end

    collection.trait :start_at_later_than_end do |item|
      start_at = "2018-04-30 00:00"
      end_at   = "2018-02-29 00:00"
      item.name 'test'
      item.start_at start_at
      item.end_at end_at
      item.discount_rate 10.0
    end
  end
end
