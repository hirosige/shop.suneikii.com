# == Schema Information
#
# Table name: orders
#
#  id                 :integer          not null, primary key
#  ordered_on         :datetime
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

class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :order_details,
                                reject_if: :all_blank,
                                allow_destroy: true

  state_machine :payment_status, :initial => :pending do
    state :pending
    state :paid
    state :refunded

    event :pay do
      transition :from => :pending, :to => :paid
    end

    event :refund do
      transition :from => :paid, :to => :refunded
    end
  end

  state_machine :fulfillment_status, :initial => :unfulfilled do
    state :unfulfilled
    state :fulfilled

    event :fulfill do
      transition :from => :unfulfilled, :to => :fulfilled
    end

    event :cancel do
      transition :from => :fulfilled, :to => :unfulfilled
    end
  end
end
