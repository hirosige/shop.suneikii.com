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

    it "initial status is active" do

      expect(@cart.active?).to be true
    end

    it "can be inactivated" do
      @cart.user_id = 1
      @cart.inactivate

      expect(@cart.inactive?).to be true
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

    it "can remove" do
      @good = Good.create(:name => 'test', :price => 100)
      @good2 = Good.create(:name => 'test2', :price => 200)
      @cart.user_id = 1
      @cart.save

      @cart.add_item(@good.id)
      @cart.add_item(@good2.id)
      @cart.cart_contents[0].change_quantity(1)
      @cart.cart_contents[1].change_quantity(1)
      @cart.save

      expect(@cart.cart_contents.size).to be 2

      @cart.remove_item(@cart.cart_contents[0].id)
      expect(@cart.cart_contents.size).to be 1
      expect(@cart.cart_contents[0].good_id).to eq @good2.id
    end

    it "can change child quantity" do
      @good = Good.create(:name => 'test', :price => 100)
      @good2 = Good.create(:name => 'test2', :price => 200)
      @cart.user_id = 1
      @cart.save

      @cart.add_item(@good.id)
      @cart.add_item(@good2.id)
      @cart.save

      @cart.change_quantity(@cart.cart_contents[0].id, 1)
      @cart.change_quantity(@cart.cart_contents[1].id, 2)
      @cart.save

      expect(@cart.cart_contents.size).to be 2
      expect(@cart.cart_contents[0].pts).to be 1
      expect(@cart.cart_contents[0].sub_amount).to eq 100.0
      expect(@cart.cart_contents[1].pts).to be 2
      expect(@cart.cart_contents[1].sub_amount).to eq 400.0
    end
  end
end