# == Schema Information
#
# Table name: colors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Color, type: :model do
  let(:mdl) { 'color' }
  let(:name) { AttrValue.attr("#{mdl}.name") }

  it 'can create' do
    color = build(:color, :white)
    expect(color.valid?).to eq true
  end

  it 'can create' do
    color = build(:color, :white)
    expect(color.valid?).to eq true
  end

  it 'name should be required' do
    collection = build(:color, :blank_name)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include blank_err_msg(name)
  end

  it 'name is too long' do
    collection = build(:color, :name_is_too_long)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include too_long_err_msg(name, 255)
  end

  it 'name should be unique fail' do
    create(:color, :unique_chk_fail)
    color = build(:color, :unique_chk_fail)
    expect(color.valid?).to eq false
    expect(color.errors.full_messages).to include taken_err_msg(name)
  end

  it 'name should be unique fail' do
    create(:color, :unique_chk_fail)
    color = build(:color, :unique_chk_success)
    expect(color.valid?).to eq true
    expect(color.errors.full_messages.size).to eq 0
  end

end
