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
  let(:name_empty) { 'Size Name cannot be blank' }
  let(:name_over255) { 'Size Name is too long (maximum is 255 characters)' }
  let(:name_duplicated) { 'Size Name has already been taken' }

  it 'can create' do
    size = build(:size, :s)
    expect(size.validate).to eq true
  end

  it 'size is required' do
    size = build(:size, :empty)
    expect(size.validate).to eq false
    expect(size.errors.full_messages).to include name_empty
  end

  it 'size is required' do
    size = build(:size, :name_255)
    expect(size.validate).to eq false
    expect(size.errors.full_messages).to include name_over255
  end

  it 'name should be unique' do
    create(:size, :s)
    size = build(:size, :s)

    expect(size.validate).to eq false
    expect(size.errors.full_messages).to include name_duplicated
  end

end
