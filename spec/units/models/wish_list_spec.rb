# == Schema Information
#
# Table name: wish_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe WishList, type: :model do

  before :each do
    @wish_list = WishList.new
  end

  describe 'can create' do

    it 'can create' do
      expect(@wish_list).not_to be nil
    end

    it 'user is required' do
      wish_list = build(:wish_list, :user_nil)
      expect(wish_list.valid?).to be false
    end

    it 'good is required' do
      wish_list = build(:wish_list, :good_nil)
      expect(wish_list.valid?).to be false
    end

    it 'good_id cannot be duplicated for same user' do
      wish_list = create(:wish_list, :one)
      wish_list2 = build(
        :wish_list, :one,
        good_id: wish_list.good_id,
        user_id: wish_list.user_id
      )

      expect(wish_list2.valid?).to be false
    end

    it 'can register not duplicated set' do
      wish_list = create(:wish_list, :one)
      wish_list2 = build(
        :wish_list,
        :one,
        user_id: wish_list.user_id,
        good_id: create(:good, :b).id
      )

      expect(wish_list2.valid?).to be true
    end
  end
end
