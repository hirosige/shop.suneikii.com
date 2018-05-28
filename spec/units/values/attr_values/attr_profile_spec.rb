# == Schema Information
#
# Table name: profiles
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  country_id      :integer
#  province_id     :integer
#  district_id     :integer
#  sub_district_id :integer
#  first_name      :string(255)
#  last_name       :string(255)
#  postal_code     :string(255)
#  address1        :text(65535)
#  address2        :text(65535)
#  tel             :string(255)
#  email           :string(255)
#  photo           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr PersonalQuestion' do
  let(:id) { I18n.t('activerecord.attributes.profile.id') }
  let(:user_id) { I18n.t('activerecord.attributes.profile.user_id') }
  let(:country_id) { I18n.t('activerecord.attributes.profile.country_id') }
  let(:province_id) { I18n.t('activerecord.attributes.profile.province_id') }
  let(:sub_district_id) { I18n.t('activerecord.attributes.profile.sub_district_id') }
  let(:first_name) { I18n.t('activerecord.attributes.profile.first_name') }
  let(:last_name) { I18n.t('activerecord.attributes.profile.last_name') }
  let(:postal_code) { I18n.t('activerecord.attributes.profile.postal_code') }
  let(:address1) { I18n.t('activerecord.attributes.profile.address1') }
  let(:address2) { I18n.t('activerecord.attributes.profile.address2') }
  let(:tel) { I18n.t('activerecord.attributes.profile.tel') }
  let(:email) { I18n.t('activerecord.attributes.profile.email') }
  let(:photo) { I18n.t('activerecord.attributes.profile.photo') }
  let(:created_at) { I18n.t('activerecord.attributes.profile.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.profile.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('profile.id')).to eq id
    expect(AttrValue.attr('profile.user_id')).to eq user_id
    expect(AttrValue.attr('profile.country_id')).to eq country_id
    expect(AttrValue.attr('profile.province_id')).to eq province_id
    expect(AttrValue.attr('profile.sub_district_id')).to eq sub_district_id
    expect(AttrValue.attr('profile.first_name')).to eq first_name
    expect(AttrValue.attr('profile.last_name')).to eq last_name
    expect(AttrValue.attr('profile.postal_code')).to eq postal_code
    expect(AttrValue.attr('profile.address1')).to eq address1
    expect(AttrValue.attr('profile.address2')).to eq address2
    expect(AttrValue.attr('profile.tel')).to eq tel
    expect(AttrValue.attr('profile.email')).to eq email
    expect(AttrValue.attr('profile.photo')).to eq photo
    expect(AttrValue.attr('profile.created_at')).to eq created_at
    expect(AttrValue.attr('profile.updated_at')).to eq updated_at
  end
end
