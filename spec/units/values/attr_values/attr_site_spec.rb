# == Schema Information
#
# Table name: sites
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  tel1             :string(255)
#  tel2             :string(255)
#  address          :text(65535)
#  privacy_policy   :text(65535)
#  condition_of_use :text(65535)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe 'Attr Site' do
  let(:id) { I18n.t('activerecord.attributes.site.id') }
  let(:name) { I18n.t('activerecord.attributes.site.name') }
  let(:email) { I18n.t('activerecord.attributes.site.email') }
  let(:tel1) { I18n.t('activerecord.attributes.site.tel1') }
  let(:tel2) { I18n.t('activerecord.attributes.site.tel2') }
  let(:address) { I18n.t('activerecord.attributes.site.address') }
  let(:privacy_policy) { I18n.t('activerecord.attributes.site.privacy_policy') }
  let(:condition_of_use) { I18n.t('activerecord.attributes.site.condition_of_use') }
  let(:created_at) { I18n.t('activerecord.attributes.site.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.site.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('site.id')).to eq id
    expect(AttrValue.attr('site.name')).to eq name
    expect(AttrValue.attr('site.email')).to eq email
    expect(AttrValue.attr('site.tel1')).to eq tel1
    expect(AttrValue.attr('site.tel2')).to eq tel2
    expect(AttrValue.attr('site.address')).to eq address
    expect(AttrValue.attr('site.privacy_policy')).to eq privacy_policy
    expect(AttrValue.attr('site.condition_of_use')).to eq condition_of_use
    expect(AttrValue.attr('site.created_at')).to eq created_at
    expect(AttrValue.attr('site.updated_at')).to eq updated_at
  end
end
