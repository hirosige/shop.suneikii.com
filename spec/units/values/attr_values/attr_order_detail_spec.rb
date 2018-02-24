# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  good_id    :integer
#  qty        :integer
#  sub_total  :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


require 'rails_helper'

RSpec.describe 'Attr Color' do
  let(:id) { I18n.t('activerecord.attributes.order_detail.id') }
  let(:order_id) { I18n.t('activerecord.attributes.order_detail.order_id') }
  let(:good_id) { I18n.t('activerecord.attributes.order_detail.good_id') }
  let(:qty) { I18n.t('activerecord.attributes.order_detail.qty') }
  let(:sub_total) { I18n.t('activerecord.attributes.order_detail.sub_total') }
  let(:created_at) { I18n.t('activerecord.attributes.order_detail.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.order_detail.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('order_detail.id')).to eq id
    expect(AttrValue.attr('order_detail.order_id')).to eq order_id
    expect(AttrValue.attr('order_detail.good_id')).to eq good_id
    expect(AttrValue.attr('order_detail.qty')).to eq qty
    expect(AttrValue.attr('order_detail.sub_total')).to eq sub_total
    expect(AttrValue.attr('order_detail.created_at')).to eq created_at
    expect(AttrValue.attr('order_detail.updated_at')).to eq updated_at
  end
end
