# == Schema Information
#
# Table name: color_selections
#
#  id         :integer          not null, primary key
#  color_id   :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ColorSelection, type: :model do
  let(:mdl) { 'color_selection' }
  let(:color_id) { AttrValue.attr("#{mdl}.color_id") }
  let(:good_id) { AttrValue.attr("#{mdl}.good_id") }

  it 'can create' do
    color_selection = build(:color_selection, :a_white)
    expect(color_selection.valid?).to eq true
  end

  it 'color must exist' do
    collection = build(:color_selection, :blank_color)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include must_exist(color_id)
  end

  it 'color must exist' do
    collection = build(:color_selection, :blank_good)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include must_exist(good_id)
  end
end
