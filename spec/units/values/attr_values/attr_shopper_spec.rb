# == Schema Information
#
# Table name: shoppers
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  photo               :string(255)
#  representative_name :string(255)
#  postal_code         :string(255)
#  address             :text(65535)
#  tel1                :string(255)
#  tel2                :string(255)
#  email               :string(255)
#  status              :integer
#  memo                :text(65535)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr PersonalQuestion' do
  let(:id) { I18n.t('activerecord.attributes.shopper.id') }
  let(:name) { I18n.t('activerecord.attributes.shopper.name') }
  let(:photo) { I18n.t('activerecord.attributes.shopper.photo') }
  let(:representative_name) { I18n.t('activerecord.attributes.shopper.representative_name') }
  let(:postal_code) { I18n.t('activerecord.attributes.shopper.postal_code') }
  let(:address) { I18n.t('activerecord.attributes.shopper.address') }
  let(:tel1) { I18n.t('activerecord.attributes.shopper.tel1') }
  let(:tel2) { I18n.t('activerecord.attributes.shopper.tel2') }
  let(:email) { I18n.t('activerecord.attributes.shopper.email') }
  let(:status) { I18n.t('activerecord.attributes.shopper.status') }
  let(:memo) { I18n.t('activerecord.attributes.shopper.memo') }
  let(:created_at) { I18n.t('activerecord.attributes.shopper.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.shopper.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('shopper.id')).to eq id
    expect(AttrValue.attr('shopper.name')).to eq name
    expect(AttrValue.attr('shopper.photo')).to eq photo
    expect(AttrValue.attr('shopper.representative_name')).to eq representative_name
    expect(AttrValue.attr('shopper.postal_code')).to eq postal_code
    expect(AttrValue.attr('shopper.address')).to eq address
    expect(AttrValue.attr('shopper.tel1')).to eq tel1
    expect(AttrValue.attr('shopper.tel2')).to eq tel2
    expect(AttrValue.attr('shopper.email')).to eq email
    expect(AttrValue.attr('shopper.status')).to eq status
    expect(AttrValue.attr('shopper.memo')).to eq memo
    expect(AttrValue.attr('shopper.created_at')).to eq created_at
    expect(AttrValue.attr('shopper.updated_at')).to eq updated_at
  end
end
