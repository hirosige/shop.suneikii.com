# == Schema Information
#
# Table name: orders
#
#  id                 :integer          not null, primary key
#  ordered_at         :datetime
#  user_id            :integer
#  payment_status     :string(255)
#  fulfillment_status :string(255)
#  total_amount       :decimal(10, 2)
#  shipping_cost      :decimal(10, 2)
#  tax                :decimal(5, 2)
#  note               :text(65535)
#  tracking_no        :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory :order do |order|
    order.trait :one do |item|
      item.ordered_at Time.zone.now
      item.association :user, factory: %i[user user1]
      item.total_amount 0.00
      item.shipping_cost 0.00
      item.tax 0.0
      item.note 'test'
      item.tracking_no 'test'
    end

    order.trait :tax_10_percent do |item|
      item.ordered_at Time.zone.now
      item.association :user, factory: %i[user user1]
      item.total_amount 0.00
      item.shipping_cost 0.00
      item.tax 10.0
      item.note 'test'
      item.tracking_no 'test'
    end

    order.trait :with_shipping_cost do |item|
      item.ordered_at Time.zone.now
      item.association :user, factory: %i[user user1]
      item.total_amount 0.00
      item.shipping_cost 1000.00
      item.tax 10.0
      item.note 'test'
      item.tracking_no 'test'
    end

  end
end
