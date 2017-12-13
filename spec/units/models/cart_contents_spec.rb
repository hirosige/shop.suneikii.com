# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe Cart, :type => :model do

  before :each do
    @cart = Cart.new
  end

  describe "can create" do

    it "can create" do
      @cart.good_id = 1
      @cart.pts = 3
      expect(@cart.pts).to be 3
    end

    it "can increase" do
      @cart.good_id = 1
      @cart.increase_cnt

      expect(@cart.pts).to be 1
    end

    it "can increase twice" do
      @cart.good_id = 1
      @cart.increase_cnt
      @cart.increase_cnt

      expect(@cart.pts).to be 2
    end

    it "can decrease" do
      @cart.good_id = 1
      @cart.pts = 3
      @cart.decrease_cnt

      expect(@cart.pts).to be 2
    end

    it "can decrease twice" do
      @cart.good_id = 1
      @cart.pts = 3
      @cart.decrease_cnt
      @cart.decrease_cnt

      expect(@cart.pts).to be 1
    end

    it "cant be minus" do
      @cart.good_id = 1
      @cart.pts = 1
      @cart.decrease_cnt
      @cart.decrease_cnt

      expect(@cart.pts).to be 0
    end

  end
end