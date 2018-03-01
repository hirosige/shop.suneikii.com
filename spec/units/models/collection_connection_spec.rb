# == Schema Information
#
# Table name: collection_connections
#
#  id            :integer          not null, primary key
#  collection_id :integer
#  good_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe CollectionConnection, type: :model do
  let(:mdl) { 'collection_connection' }
  let(:collection_id) { AttrValue.attr("#{mdl}.collection_id") }
  let(:good_id) { AttrValue.attr("#{mdl}.good_id") }

  it 'can create' do
    collection = build(:collection_connection, :summer_collection_a)
    expect(collection.valid?).to eq true
  end

  it 'collection must exist' do
    collection = build(:collection_connection, :blank_collection)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include must_exist(collection_id)
  end

  it 'good must exist' do
    collection = build(:collection_connection, :blank_good)
    expect(collection.valid?).to eq false
    expect(collection.errors.full_messages).to include must_exist(good_id)
  end

end
