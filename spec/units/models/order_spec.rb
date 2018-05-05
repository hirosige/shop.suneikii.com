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

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:mdl) { 'order' }
  let(:ordered_on) { AttrValue.attr("#{mdl}.ordered_on") }
  let(:user_id) { AttrValue.attr("#{mdl}.user_id") }
  let(:payment_status) { AttrValue.attr("#{mdl}.payment_status") }
  let(:fulfillment_status) { AttrValue.attr("#{mdl}.fulfillment_status") }
  let(:total_amount) { AttrValue.attr("#{mdl}.total_amount") }
  let(:shipping_cost) { AttrValue.attr("#{mdl}.shipping_cost") }
  let(:tax) { AttrValue.attr("#{mdl}.tax") }
  let(:note) { AttrValue.attr("#{mdl}.note") }
  let(:tracking_no) { AttrValue.attr("#{mdl}.tracking_no") }

  it 'can create' do
    order = build(:order, :one)
    expect(order.valid?).to eq true
  end

  it 'can add detail' do
    order = create(:order, :one)
    create(:order_detail, :good_a_three, order_id: order.id)
    expect(order.order_details.size).to eq 1
    expect(order.order_details[0].sub_amount).to eq 6000.00
  end

  it 'can change pts' do
    order = create(:order, :one)
    create(:order_detail, :good_a_three, order_id: order.id)
    order.details(0).change_pts(4)
    expect(order.details(0).sub_amount).to eq 8000.00
  end

  it 'can buy multi stuff' do
    order = create(:order, :one)
    create(:order_detail, :good_a_three, order_id: order.id)
    create(:order_detail, :good_b_two, order_id: order.id)
    expect(order.details(0).sub_amount).to eq 6000.00
    expect(order.details(1).sub_amount).to eq 9000.00
    order.calc
    expect(order.total_amount).to eq 15000.00
  end

  it 'can be deducted tax' do
    order = create(:order, :tax_10_percent)
    create(:order_detail, :good_a_three, order_id: order.id)
    create(:order_detail, :good_b_two, order_id: order.id)
    expect(order.details(0).sub_amount).to eq 6000.00
    expect(order.details(1).sub_amount).to eq 9000.00
    order.calc
    expect(order.total_amount).to eq 16500.00
  end

  it 'can add shipping cost' do
    order = create(:order, :with_shipping_cost)
    create(:order_detail, :good_a_three, order_id: order.id)
    create(:order_detail, :good_b_two, order_id: order.id)
    expect(order.details(0).sub_amount).to eq 6000.00
    expect(order.details(1).sub_amount).to eq 9000.00
    order.calc
    expect(order.total_amount).to eq 17500.00
  end

  it 'can copy from cart' do
    cart = create(:cart, :copy_ex)
    create(:cart_content, :copy_ex1, cart_id: cart.id)
    create(:cart_content, :copy_ex2, cart_id: cart.id)

    order = Order.convert_cart_by(cart.id)
    order.save

    expect(order.order_details.size).to eq 2
    expect(order.total_amount).to eq 15000.00
  end

  it 'state from pending' do
    order = create(:order, :with_shipping_cost)
    create(:order_detail, :good_a_three, order_id: order.id)
    create(:order_detail, :good_b_two, order_id: order.id)
    expect(order.pending?).to eq true

    order.pay
    expect(order.paid?).to eq false

    order.decline
    expect(order.declined?).to eq false

    order.approve
    expect(order.approved?).to eq false

    order.distribute
    expect(order.distributed?).to eq false

    expect{ order.prepare }.to change{ order.processing? }.from(false).to(true)
    expect{ order.cancel }.to change{ order.canceled? }.from(false).to(true)
  end

  it 'can prepare' do
    order = create(:order, :with_shipping_cost)
    create(:order_detail, :good_a_three, order_id: order.id)
    create(:order_detail, :good_b_two, order_id: order.id)
    order.prepare
    expect(order.payment.nil?).to eq false
    expect{ order.cancel }.to change{ order.canceled? }.from(false).to(true)
  end

  it 'can pay' do
    order = create(:order, :with_shipping_cost)
    create(:order_detail, :good_a_three, order_id: order.id)
    create(:order_detail, :good_b_two, order_id: order.id)
    order.prepare
    expect{ order.pay }.to change{ order.paid? }.from(false).to(true)
    expect{ order.cancel }.to change{ order.canceled? }.from(false).to(true)
  end

  it 'can decline' do
    order = create(:order, :with_shipping_cost)
    create(:order_detail, :good_a_three, order_id: order.id)
    create(:order_detail, :good_b_two, order_id: order.id)
    order.prepare
    order.pay
    expect{ order.decline }.to change{ order.declined? }.from(false).to(true)
    expect{ order.cancel }.to change{ order.canceled? }.from(false).to(true)
  end

  it 'can approve' do
    order = create(:order, :with_shipping_cost)
    create(:order_detail, :good_a_three, order_id: order.id)
    create(:order_detail, :good_b_two, order_id: order.id)
    order.prepare
    order.pay
    expect{ order.decline }.to change{ order.declined? }.from(false).to(true)
    expect{ order.cancel }.to change{ order.canceled? }.from(false).to(true)
  end
end
