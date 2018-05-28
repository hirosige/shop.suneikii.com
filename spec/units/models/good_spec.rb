# == Schema Information
#
# Table name: goods
#
#  id                :integer          not null, primary key
#  shopper_id        :integer
#  goods_category_id :integer
#  name              :string(255)
#  thumbnail         :string(255)
#  price             :decimal(10, 2)
#  description       :string(255)
#  gender            :integer
#  admin_memo        :text(65535)
#  status            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Good, type: :model do
  let(:mdl) { 'good' }
  let(:shopper_id) { AttrValue.attr("#{mdl}.shopper_id") }
  let(:goods_category_id) { AttrValue.attr("#{mdl}.goods_category_id") }
  let(:name) { AttrValue.attr("#{mdl}.name") }
  let(:thumbnail) { AttrValue.attr("#{mdl}.thumbnail") }
  let(:price) { AttrValue.attr("#{mdl}.price") }
  let(:description) { AttrValue.attr("#{mdl}.description") }
  let(:gender) { AttrValue.attr("#{mdl}.gender") }
  let(:admin_memo) { AttrValue.attr("#{mdl}.admin_memo") }
  let(:status) { AttrValue.attr("#{mdl}.status") }

  it 'can create' do
    good = build(:good, :a)
    expect(good.valid?).to eq true
  end

  it 'shopper must exist' do
    good = build(:good, :blank_shopper)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include must_exist(shopper_id)
  end

  it 'goods category must exist' do
    good = build(:good, :blank_goods_category)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include must_exist(goods_category_id)
  end

  it 'name should be required' do
    good = build(:good, :blank_name)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include blank_err_msg(name)
  end

  it 'thumbnail should be required' do
    good = build(:good, :blank_thumbnail)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include blank_err_msg(thumbnail)
  end

  it 'price should be required' do
    good = build(:good, :blank_price)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include blank_err_msg(price)
  end

  it 'gender should be required' do
    good = build(:good, :blank_gender)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include blank_err_msg(gender)
  end

  it 'gender should be required' do
    good = build(:good, :blank_gender)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include blank_err_msg(gender)
  end

  it 'name is too long' do
    good = build(:good, :name_is_too_long)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include too_long_err_msg(name, 255)
  end

  it 'desc is too long' do
    good = build(:good, :desc_is_too_long)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include too_long_err_msg(description, 255)
  end

  it 'admin_memo is too long' do
    good = build(:good, :admin_memo_is_too_long)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include too_long_err_msg(admin_memo, 65535)
  end

  it 'name should be unique fail' do
    create(:good, :unique_chk_fail1)
    good = build(:good, :unique_chk_fail2)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include taken_err_msg(name)
  end
end
