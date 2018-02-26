# == Schema Information
#
# Table name: site_inquiries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr PersonalQuestion' do
  let(:id) { I18n.t('activerecord.attributes.site_inquiry.id') }
  let(:name) { I18n.t('activerecord.attributes.site_inquiry.name') }
  let(:email) { I18n.t('activerecord.attributes.site_inquiry.email') }
  let(:body) { I18n.t('activerecord.attributes.site_inquiry.body') }
  let(:created_at) { I18n.t('activerecord.attributes.shopper.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.shopper.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('site_inquiry.id')).to eq id
    expect(AttrValue.attr('site_inquiry.name')).to eq name
    expect(AttrValue.attr('site_inquiry.email')).to eq email
    expect(AttrValue.attr('site_inquiry.body')).to eq body
    expect(AttrValue.attr('site_inquiry.created_at')).to eq created_at
    expect(AttrValue.attr('site_inquiry.updated_at')).to eq updated_at
  end
end
