# == Schema Information
#
# Table name: cart_contents
#
#  id         :integer          not null, primary key
#  good_id    :integer
#  pts        :integer
#  sub_amount :decimal(16, 3)
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr CartContent' do
  let(:id) { I18n.t('activerecord.attributes.cart_content.id') }
  let(:good_id) { I18n.t('activerecord.attributes.cart_content.good_id') }
  let(:pts) { I18n.t('activerecord.attributes.cart_content.pts') }
  let(:sub_amount) { I18n.t('activerecord.attributes.cart_content.sub_amount') }
  let(:cart_id) { I18n.t('activerecord.attributes.cart_content.cart_id') }
  let(:created_at) { I18n.t('activerecord.attributes.cart_content.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.cart_content.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('cart_content.id')).to eq id
    expect(AttrValue.attr('cart_content.good_id')).to eq good_id
    expect(AttrValue.attr('cart_content.pts')).to eq pts
    expect(AttrValue.attr('cart_content.sub_amount')).to eq sub_amount
    expect(AttrValue.attr('cart_content.cart_id')).to eq cart_id
    expect(AttrValue.attr('cart_content.created_at')).to eq created_at
    expect(AttrValue.attr('cart_content.updated_at')).to eq updated_at
  end
end
