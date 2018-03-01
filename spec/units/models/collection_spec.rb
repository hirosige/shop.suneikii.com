# == Schema Information
#
# Table name: collections
#
#  id            :integer          not null, primary key
#  start_at      :datetime
#  end_at        :datetime
#  discount_rate :decimal(5, 2)
#  status        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Collection, type: :model do
  let(:mdl) { 'collection' }
  let(:name) { AttrValue.attr("#{mdl}.name") }
  let(:start_at) { AttrValue.attr("#{mdl}.start_at") }
  let(:end_at) { AttrValue.attr("#{mdl}.end_at") }
  let(:discount_rate) { AttrValue.attr("#{mdl}.discount_rate") }
  let(:status) { AttrValue.attr("#{mdl}.status") }

  before do
    Timecop.freeze(Time.local(2018, 3, 1, 14, 38, 0))
  end

  after do
    Timecop.return
  end

  it 'can create' do
    collection = build(:collection, :summer_collection)
    expect(collection.valid?).to eq true
  end

  it 'name should be required' do
    collection = build(:collection, :blank_name)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include blank_err_msg(name)
  end

  it 'start_at should be required' do
    collection = build(:collection, :blank_start_at)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include blank_err_msg(start_at)
  end

  it 'end_at should be required' do
    collection = build(:collection, :blank_end_at)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include blank_err_msg(end_at)
  end

  it 'discount_rate should be required' do
    collection = build(:collection, :blank_discount_rate)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include blank_err_msg(discount_rate)
  end

  it 'name is too long' do
    collection = build(:collection, :name_is_too_long)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include too_long_err_msg(name, 255)
  end

  it 'start_at should be valid format' do
    collection = build(:collection, :invalid_datetime_start_at)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include invalid_datetime(start_at)
  end

  it 'end_at should be valid format' do
    collection = build(:collection, :invalid_datetime_end_at)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include invalid_datetime(end_at)
  end

  it 'discount_rate should be numeric' do
    collection = build(:collection, :string_discount_rate)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include is_not_a_number_err_msg(discount_rate)
  end

  it 'start_at should be future_date' do
    collection = build(:collection, :past_start_at)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include future_date(start_at)
  end

  it 'start_at should be before end_at' do
    collection = build(:collection, :start_at_later_than_end)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include comp_date(start_at, end_at)
  end

  it 'start_at should be before end_at' do
    collection = build(:collection, :start_at_later_than_end)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include comp_date(start_at, end_at)
  end

end
