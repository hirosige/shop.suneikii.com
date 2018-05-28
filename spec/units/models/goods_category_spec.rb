# == Schema Information
#
# Table name: goods_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe GoodsCategory, type: :model do
  let(:mdl) { 'goods_category' }
  let(:name) { AttrValue.attr("#{mdl}.name") }

  it 'can create' do
    good = build(:goods_category, :soap)
    expect(good.valid?).to eq true
  end

  it 'name should be required' do
    good = build(:goods_category, :blank_name)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include blank_err_msg(name)
  end

  it 'name is too long' do
    good = build(:goods_category, :name_is_too_long)
    expect(good.valid?).to eq false
    expect(good.errors.full_messages).to include too_long_err_msg(name, 255)
  end

  it 'name should be unique fail' do
    create(:goods_category, :unique_chk_fail)
    good = build(:goods_category, :unique_chk_fail)
    expect(good.valid?).to eq true
    expect(good.errors.full_messages.size).to eq 0
  end

  it 'name should be unique fail' do
    create(:goods_category, :unique_chk_fail)
    good = build(:goods_category, :unique_chk_success)
    expect(good.valid?).to eq true
    expect(good.errors.full_messages.size).to eq 0
  end
end
