# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe CartContent, :type => :model do

  describe "can create" do

    before :each do
      @cart_contents = CartContent.new
    end

    it "can create" do
      expect(@cart_contents).not_to be nil
    end

    it "can put properties" do
      @cart_contents.good_id = 1
      @cart_contents.pts = 1
      @cart_contents.sub_amount = 0
      @cart_contents.cart_id = 1
      expect(@cart_contents).to be_valid
    end

    it "can put decimal into sub_amount" do
      @cart_contents.good_id = 1
      @cart_contents.pts = 1
      @cart_contents.sub_amount = 10000.00
      @cart_contents.cart_id = 1
      expect(@cart_contents).to be_valid
    end

    it "can calc" do
      @good = Good.create(:name => 'test', :price => 100)
      @cart_contents.good_id = @good.id
      @cart_contents.pts = 3
      @cart_contents.cart_id = 1
      @cart_contents.calc_sub_amount
      expect(@cart_contents.sub_amount).to eq 300.0
      expect(@cart_contents).to be_valid
    end

    it "can change quantity" do
      @good = Good.create(:name => 'test', :price => 100)
      @cart_contents.good_id = @good.id
      @cart_contents.pts = 3
      @cart_contents.calc_sub_amount
      expect(@cart_contents.sub_amount).to eq 300.0

      expect{@cart_contents.change_quantity(4)}.to change{@cart_contents.pts}.from(3).to(4)
      expect(@cart_contents.sub_amount).to eq 400.0
    end

    it "can change zero" do
      @good = Good.create(:name => 'test', :price => 100)
      @cart_contents.good_id = @good.id
      @cart_contents.pts = 3
      @cart_contents.calc_sub_amount

      @cart_contents.change_quantity(0)
      expect(@cart_contents.errors.size).not_to eq 0
    end

    it "can change to minus" do
      @good = Good.create(:name => 'test', :price => 100)
      @cart_contents.good_id = @good.id
      @cart_contents.pts = 3
      @cart_contents.calc_sub_amount

      @cart_contents.change_quantity(-3)
      expect(@cart_contents.errors.size).not_to eq 0
    end

    it "has the card" do
      @cart = Cart.create(
          :total_amount => 0.0,
          :user_id => 1
      )

      @cart_contents.cart_id = @cart.id
      expect(@cart_contents.cart).not_to be nil
    end

    it "good_id cannot be empty" do
      expect(@cart_contents.valid?).to be false
    end

    it "pts cannot be empty" do
      @cart_contents.good_id = 1
      expect(@cart_contents.valid?).to be false
    end

    it "sub_amount cannot be empty" do
      @cart_contents.good_id = 1
      @cart_contents.pts = 2
      expect(@cart_contents.valid?).to be false
    end

    it "cart_id cannot be empty" do
      @cart_contents.good_id = 1
      @cart_contents.pts = 2
      @cart_contents.sub_amount = 10.0
      expect(@cart_contents.valid?).to be false
    end

    it "cart_contents is valid" do
      @cart_contents.good_id = 1
      @cart_contents.pts = 2
      @cart_contents.sub_amount = 10.0
      @cart_contents.cart_id = 1
      expect(@cart_contents.valid?).to be true
    end

    it "pts should be more than 0" do
      @cart_contents.good_id = 1
      @cart_contents.pts = 0
      @cart_contents.sub_amount = 10.0
      @cart_contents.cart_id = 1

      expect(@cart_contents.valid?).to be false
    end

    it "cannot duplicate good_id cart_id in contents" do
      @cart = CartContent.create(
          :good_id => 1,
          :pts => 1,
          :sub_amount => 10.0,
          :cart_id => 1
      )

      @cart2 = CartContent.new(
          :good_id => 1,
          :pts => 1,
          :sub_amount => 10.0,
          :cart_id => 1
      )

      expect(@cart2.save).to be false
    end

  end
end