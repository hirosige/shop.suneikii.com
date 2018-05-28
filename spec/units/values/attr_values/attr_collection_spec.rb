# == Schema Information
#
# Table name: collections
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  start_at      :datetime
#  end_at        :datetime
#  discount_rate :decimal(5, 2)
#  status        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Collection' do
  let(:id) { I18n.t('activerecord.attributes.collection.id') }
  let(:name) { I18n.t('activerecord.attributes.collection.name') }
  let(:start_at) { I18n.t('activerecord.attributes.collection.start_at') }
  let(:end_at) { I18n.t('activerecord.attributes.collection.end_at') }
  let(:discount_rate) { I18n.t('activerecord.attributes.collection.discount_rate') }
  let(:status) { I18n.t('activerecord.attributes.collection.status') }
  let(:created_at) { I18n.t('activerecord.attributes.collection.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.collection.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('collection.id')).to eq id
    expect(AttrValue.attr('collection.name')).to eq name
    expect(AttrValue.attr('collection.start_at')).to eq start_at
    expect(AttrValue.attr('collection.end_at')).to eq end_at
    expect(AttrValue.attr('collection.discount_rate')).to eq discount_rate
    expect(AttrValue.attr('collection.status')).to eq status
    expect(AttrValue.attr('collection.created_at')).to eq created_at
    expect(AttrValue.attr('collection.updated_at')).to eq updated_at
  end
end
