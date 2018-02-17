# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Size, type: :model do
  it 'can create' do
    size = build(:size, :s)
    expect(size.validate).to eq true
  end

  it 'size is required' do
    size = build(:size, :empty)
    expect(size.validate).to eq false
  end

  it 'size is required' do
    size = build(:size, :name_255)
    expect(size.validate).to eq false
  end

  it 'name should be unique' do
    create(:size, :s)
    size = build(:size, :s)

    expect(size.validate).to eq false
  end

end
