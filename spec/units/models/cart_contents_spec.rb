# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe CartContent, :type => :model do
  it "can create" do
    cart_content = build(:cart_content, :buy_a_one_in_my_cart)
    expect(cart_content.valid?).to eq true
  end

  it "can calc" do
    cart_content = build(:cart_content, :buy_a_three_in_my_cart)
    cart_content.calc_sub_amount
    expect(cart_content.sub_amount).to eq 6000.0
    expect(cart_content.valid?).to eq true
  end

  it "can change quantity" do
    cart_content = build(:cart_content, :buy_a_three_in_my_cart)
    cart_content.calc_sub_amount
    expect(cart_content.sub_amount).to eq 6000.0

    expect{cart_content.change_quantity(4)}.to change{cart_content.pts}.from(3).to(4)
    expect(cart_content.sub_amount).to eq 8000.0
  end

  it "cannot change zero" do
    cart_content = build(:cart_content, :buy_a_three_in_my_cart)
    cart_content.calc_sub_amount
    expect{ cart_content.change_quantity(0) }.to raise_error RuntimeError, "can't input 0 and less for quantity"
  end

  it "can change to minus" do
    cart_content = build(:cart_content, :buy_a_three_in_my_cart)
    cart_content.calc_sub_amount
    expect{ cart_content.change_quantity(-3) }.to raise_error RuntimeError, "can't input 0 and less for quantity"
  end

  it "good_id cannot be empty" do
    cart_content = build(:cart_content, :blank_good)
    expect(cart_content.valid?).to eq false
  end

  it "pts cannot be empty" do
    cart_content = build(:cart_content, :blank_pts)
    expect(cart_content.valid?).to eq false
  end

  it "sub_amount cannot be empty" do
    cart_content = build(:cart_content, :blank_sub_amount)
    expect(cart_content.valid?).to eq false
  end

  it "cart_id cannot be empty" do
    cart_content = build(:cart_content, :blank_cart)
    expect(cart_content.valid?).to eq false
  end

  it "pts should be more than 0" do
    cart_content = build(:cart_content, :pts_is_zero)
    expect(cart_content.valid?).to eq false
  end

  it "cannot duplicate good_id cart_id in contents" do
    cart_content = create(:cart_content, :unique_chk_fail)
    new_cart_content = build(:cart_content, :unique_chk_fail, cart_id: cart_content.cart_id, good_id: cart_content.good_id)
    expect(new_cart_content.valid?).to eq false
  end
end