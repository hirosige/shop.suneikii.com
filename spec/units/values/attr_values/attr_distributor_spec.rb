# == Schema Information
#
# Table name: distributors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  tel        :string(255)
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Color' do
  let(:id) { I18n.t('activerecord.attributes.distributor.id') }
  let(:name) { I18n.t('activerecord.attributes.distributor.name') }
  let(:tel) { I18n.t('activerecord.attributes.distributor.tel') }
  let(:address) { I18n.t('activerecord.attributes.distributor.address') }
  let(:created_at) { I18n.t('activerecord.attributes.distributor.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.distributor.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('distributor.id')).to eq id
    expect(AttrValue.attr('distributor.name')).to eq name
    expect(AttrValue.attr('distributor.tel')).to eq tel
    expect(AttrValue.attr('distributor.address')).to eq address
    expect(AttrValue.attr('distributor.created_at')).to eq created_at
    expect(AttrValue.attr('distributor.updated_at')).to eq updated_at
  end
end
