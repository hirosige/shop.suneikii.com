# == Schema Information
#
# Table name: wash_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe WashList, type: :model do

  before :each do
    @wash_list = WashList.new
  end

  describe "can create" do

    it "can create" do
      expect(@wash_list).not_to be nil
    end

    it "good_id cannot be empty" do
      expect(@wash_list.valid?).to be false
    end

    it "good_id is valid" do
      @wash_list.good_id = 1
      expect(@wash_list.valid?).to be true
    end

    it "good_id cannot be duplicated for same user" do
      @wash_list.good_id = 1
      @wash_list.user_id = 1
      @wash_list.save

      @wash_list2 = WashList.new(
        :good_id => 1,
        :user_id => 1
      )

      expect(@wash_list2.valid?).to be false
    end

    it "can register not duplicated set" do
      @wash_list.good_id = 1
      @wash_list.user_id = 1
      @wash_list.save

      @wash_list2 = WashList.new(
          :good_id => 1,
          :user_id => 2
      )

      expect(@wash_list2.valid?).to be true
    end
  end
end
