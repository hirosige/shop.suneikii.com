# == Schema Information
#
# Table name: distributors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  tel        :string(255)
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :distributor do |distributor|
    distributor.trait :ups do |item|
      item.name 'test'
      item.tel '099999999'
      item.address 'test'
    end

    distributor.trait :blank_name do |item|
      item.tel '099999999'
      item.address 'test'
    end

    distributor.trait :blank_tel do |item|
      item.name 'test'
      item.address 'test'
    end

    distributor.trait :blank_address do |item|
      item.name 'test'
      item.tel '099999999'
    end

    distributor.trait :name_is_too_long do |item|
      too_long_name = "M" * 256
      item.name too_long_name
      item.tel '099999999'
      item.address 'test'
    end

    distributor.trait :tel_is_too_long do |item|
      too_long_tel = "M" * 256
      item.name 'test'
      item.tel too_long_tel
      item.address 'test'
    end

    distributor.trait :address_is_too_long do |item|
      too_long_address = "M" * 256
      item.name 'test'
      item.tel 'test'
      item.address too_long_address
    end

    distributor.trait :unique_chk_fail do |item|
      item.name 'UPS'
      item.tel '099999999'
      item.address 'test'
    end

    distributor.trait :unique_chk_success do |item|
      item.name 'Fedex'
      item.tel '099999999'
      item.address 'test'
    end
  end
end
