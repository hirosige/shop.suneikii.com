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

RSpec.describe 'Attr ColorConnection' do
  let(:id) { I18n.t('activerecord.attributes.collection_connection.id') }
  let(:collection_id) { I18n.t('activerecord.attributes.collection_connection.collection_id') }
  let(:good_id) { I18n.t('activerecord.attributes.collection_connection.good_id') }
  let(:created_at) { I18n.t('activerecord.attributes.collection_connection.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.collection_connection.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('collection_connection.id')).to eq id
    expect(AttrValue.attr('collection_connection.collection_id')).to eq collection_id
    expect(AttrValue.attr('collection_connection.good_id')).to eq good_id
    expect(AttrValue.attr('collection_connection.created_at')).to eq created_at
    expect(AttrValue.attr('collection_connection.updated_at')).to eq updated_at
  end
end
