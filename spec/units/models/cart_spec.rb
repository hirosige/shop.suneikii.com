# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe Cart, :type => :model do

  before :each do
    @cart = Cart.new
  end

  describe "can create" do

    it "can create" do
      expect(@cart).not_to be nil
    end

    it "can put properties" do
      @cart.user_id = 1
      @cart.total_amount = 10.02

      expect(@cart).to be_valid
    end

    it "can put decimal" do
      @cart.user_id = 1
      @cart.total_amount = 10000000000000000.000

      expect(@cart).to be_valid
    end

    it "initial status is on_going" do

      expect(@cart.on_going?).to be true
    end

    it "can be done" do
      @cart.user_id = 1
      @cart.fix

      expect(@cart.done?).to be true
    end

    it "has many cart_contents" do
      expect(@cart.cart_contents).not_to be nil
    end

    it "user_id cannot be empty" do
      expect(@cart.valid?).to be false
    end

    it "user_id is valid" do
      @cart.user_id = 1
      expect(@cart.valid?).to be true
    end

    it "can add to shopping cart" do
      @good = Good.create(:name => 'test', :price => 100)
      @cart.add_item(@good.id)

      expect(@cart.cart_contents.size).to be 1
    end

    it "should be calced after add" do
      @good = Good.create(:name => 'test', :price => 100)
      @cart.add_item(@good.id)

      expect(@cart.cart_contents[0].sub_amount).to eq 100.0
    end
  end
end