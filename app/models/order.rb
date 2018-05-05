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

class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_one :payment
  belongs_to :user

  accepts_nested_attributes_for :order_details,
                                reject_if: :all_blank,
                                allow_destroy: true

  state_machine :payment_status, :initial => :pending do
    state :pending
    state :processing
    state :paid
    state :declined
    state :approved
    state :distributed
    state :canceled

    after_transition on: :prepare, do: :make_payment

    event :prepare do
      transition from: :pending, to: :processing
    end

    event :pay do
      transition from: :processing, to: :paid
    end

    event :decline do
      transition from: :paid, to: :declined
    end

    event :approve do
      transition from: :paid, to: :approved
    end

    event :distribute do
      transition from: :approved, to: :distributed
    end

    event :cancel do
      transition from: any, to: :canceled
    end
  end

  state_machine :fulfillment_status, :initial => :unfulfilled do
    state :unfulfilled
    state :fulfilled

    event :fulfill do
      transition :from => :unfulfilled, :to => :fulfilled
    end

  end

  def details(index)
    order_details[index]
  end

  def calc
    order_details.each(&:calc_sub_amount)

    total_amount = order_details.sum { |attr| attr[:sub_amount]}
    total_amount = total_amount + total_amount * (self.tax / 100) unless self.tax.nil?
    total_amount = total_amount + self.shipping_cost unless self.shipping_cost.nil?
    self.total_amount = total_amount
  end

  def self.convert_cart_by(cart_id)
    cart = Cart.find(cart_id)
    order = Order.new

    order.total_amount = cart.total_amount
    order.user_id = cart.user_id

    cart.cart_contents.each do |content|
      order.order_details.build(
        good_id: content.good_id,
        pts: content.pts,
        sub_amount: content.sub_amount
      )
    end

    order.calc
    order
  end

  def make_payment
    self.build_payment
    save
  end
end
