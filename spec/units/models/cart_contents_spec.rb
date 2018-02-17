# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe CartContent, :type => :model do

  describe "can create" do

    before :each do
      @cart_contents = CartContent.new
      @user = create(:user, :user1)
      @cart = create(:cart, :one, user_id: @user.id)
      @category = create(:goods_category, :soap)
      @shopper = create(:shopper, :a, user_id: @user.id)
      @good1 = create(:good, :a, goods_category_id: @category.id, shopper_id: @shopper.id)
      @good2 = create(:good, :b, goods_category_id: @category.id, shopper_id: @shopper.id)
    end

    it "can create" do
      expect(@cart_contents).not_to be nil
    end

    it "can put properties" do
      @cart_contents.good_id = @good1.id
      @cart_contents.pts = 1
      @cart_contents.sub_amount = 0
      @cart_contents.cart_id = @cart.id
      expect(@cart_contents).to be_valid
    end

    it "can put decimal into sub_amount" do
      @cart_contents.good_id = @good1.id
      @cart_contents.pts = 1
      @cart_contents.sub_amount = 10000.00
      @cart_contents.cart_id = @cart.id
      expect(@cart_contents).to be_valid
    end

    it "can calc" do
      @cart_contents.good_id = @good1.id
      @cart_contents.pts = 3
      @cart_contents.cart_id = @cart.id
      @cart_contents.calc_sub_amount
      expect(@cart_contents.sub_amount).to eq 6000.0
      expect(@cart_contents).to be_valid
    end

    it "can change quantity" do
      @cart_contents.good_id = @good1.id
      @cart_contents.pts = 3
      @cart_contents.calc_sub_amount
      expect(@cart_contents.sub_amount).to eq 6000.0

      expect{@cart_contents.change_quantity(4)}.to change{@cart_contents.pts}.from(3).to(4)
      expect(@cart_contents.sub_amount).to eq 8000.0
    end

    it "can change zero" do
      @cart_contents.good_id = @good1.id
      @cart_contents.pts = 3
      @cart_contents.calc_sub_amount

      @cart_contents.change_quantity(0)
      expect(@cart_contents.errors.size).not_to eq 0
    end

    it "can change to minus" do
      @cart_contents.good_id = @good1.id
      @cart_contents.pts = 3
      @cart_contents.calc_sub_amount

      @cart_contents.change_quantity(-3)
      expect(@cart_contents.errors.size).not_to eq 0
    end

    it "has the card" do
      @cart_contents.cart_id = @cart.id
      expect(@cart_contents.cart).not_to be nil
    end

    it "good_id cannot be empty" do
      expect(@cart_contents.valid?).to be false
    end

    it "pts cannot be empty" do
      @cart_contents.good_id = @good1.id
      expect(@cart_contents.valid?).to be false
    end

    it "sub_amount cannot be empty" do
      @cart_contents.good_id = @good1.id
      @cart_contents.pts = 2
      expect(@cart_contents.valid?).to be false
    end

    it "cart_id cannot be empty" do
      @cart_contents.good_id = @good1.id
      @cart_contents.pts = 2
      @cart_contents.sub_amount = 10.0
      expect(@cart_contents.valid?).to be false
    end

    it "cart_contents is valid" do
      @cart_contents.good_id = @good1.id
      @cart_contents.pts = 2
      @cart_contents.sub_amount = 10.0
      @cart_contents.cart_id = @cart.id
      expect(@cart_contents.valid?).to be true
    end

    it "pts should be more than 0" do
      @cart_contents.good_id = @good1.id
      @cart_contents.pts = 0
      @cart_contents.sub_amount = 10.0
      @cart_contents.cart_id = @cart.id

      expect(@cart_contents.valid?).to be false
    end

    it "cannot duplicate good_id cart_id in contents" do
      @cart = CartContent.create(
        good_id: 1,
        pts: 1,
        sub_amount: 10.0,
        cart_id: @cart.id
      )

      @cart2 = CartContent.new(
        good_id: 1,
        pts: 1,
        sub_amount: 10.0,
        cart_id: @cart.id
      )

      expect(@cart2.save).to be false
    end

  end
end