# == Schema Information
#
# Table name: size_selections
#
#  id         :integer          not null, primary key
#  size_id    :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe SizeSelection, type: :model do

  it 'size is required' do
    size_selection = build(:size_selection, :size_nil)
    expect(size_selection.valid?).to eq false
  end

  it 'good is required' do
    size_selection = build(:size_selection, :good_nil)
    expect(size_selection.valid?).to eq false
  end
end
