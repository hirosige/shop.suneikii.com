# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: carts
#
#  id           :integer          not null, primary key
#  total_amount :decimal(16, 3)
#  status       :string(255)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Cart, :type => :model do
  let(:mdl) { 'cart' }
  let(:total_amount) { AttrValue.attr("#{mdl}.total_amount") }
  let(:status) { AttrValue.attr("#{mdl}.status") }
  let(:user_id) { AttrValue.attr("#{mdl}.user_id") }

  it "can create" do
    cart = build(:cart, :my_cart)
    expect(cart.valid?).to eq true
  end

  it "initial status is active" do
    cart = build(:cart, :my_cart)
    expect(cart.active?).to eq true
  end

  it "can be inactivated" do
    cart = build(:cart, :my_cart)

    expect(cart.active?).to eq true
    cart.inactivate
    expect(cart.active?).to eq false
  end

  it "user_id cannot be empty" do
    cart = build(:cart, :blank_user)
    expect(cart.valid?).to be false
    expect(cart.errors.full_messages).to include must_exist(user_id)
  end

  it "can add to shopping cart" do
    good_a = create(:good, :a)
    cart = create(:cart, :my_cart)
    cart.add_item(good_a.id)

    expect(cart.size).to be 1
    expect(cart.contents(0).sub_amount).to eq 2000.0
  end

  it "can remove" do
    good_a = create(:good, :a)
    good_b = create(:good, :b)
    cart = create(:cart, :my_cart)

    cart.add_item(good_a.id)
    cart.add_item(good_b.id)

    cart.change_quantity(id: cart.contents(0).id, qty: 1)
    cart.change_quantity(id: cart.contents(1).id, qty: 1)

    expect(cart.size).to be 2

    cart.remove_item(cart.contents(0).id)
    expect(cart.size).to be 1
    expect(cart.contents(0).good_id).to eq good_b.id
  end

  it "can change child quantity" do
    good_a = create(:good, :a)
    good_b = create(:good, :b)
    cart = create(:cart, :my_cart)

    cart.add_item(good_a.id)
    cart.add_item(good_b.id)

    cart.change_quantity(id: cart.contents(0).id, qty: 1)
    cart.change_quantity(id: cart.contents(1).id, qty: 2)

    expect(cart.cart_contents.size).to be 2
    expect(cart.contents(0).pts).to be 1
    expect(cart.contents(0).sub_amount).to eq 2000.0
    expect(cart.contents(1).pts).to be 2
    expect(cart.contents(1).sub_amount).to eq 6000.0
  end

  it "can calc total amount" do
    good_a = create(:good, :a)
    good_b = create(:good, :b)
    cart = create(:cart, :my_cart)

    cart.add_item(good_a.id)
    expect(cart.total_amount).to eq 2000.0

    cart.add_item(good_b.id)
    expect(cart.total_amount).to eq 5000.0

    cart.change_quantity(id: cart.contents(0).id, qty: 3)
    cart.change_quantity(id: cart.contents(1).id, qty: 5)
    expect(cart.total_amount).to eq 21000.0

  end
end
