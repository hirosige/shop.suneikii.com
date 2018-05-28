# == Schema Information
#
# Table name: orders
#
#  id                 :integer          not null, primary key
#  ordered_on         :datetime
#  user_id            :integer
#  payment_status     :string(255)
#  fulfillment_status :string(255)
#  total_amount       :decimal(10, 2)
#  shipping_cost      :decimal(10, 2)
#  tax                :decimal(5, 2)
#  note               :text(65535)
#  tracking_no        :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Color' do
  let(:id) { I18n.t('activerecord.attributes.order.id') }
  let(:ordered_on) { I18n.t('activerecord.attributes.order.ordered_on') }
  let(:user_id) { I18n.t('activerecord.attributes.order.user_id') }
  let(:payment_status) { I18n.t('activerecord.attributes.order.payment_status') }
  let(:fulfillment_status) { I18n.t('activerecord.attributes.order.fulfillment_status') }
  let(:total_amount) { I18n.t('activerecord.attributes.order.total_amount') }
  let(:shipping_cost) { I18n.t('activerecord.attributes.order.shipping_cost') }
  let(:tax) { I18n.t('activerecord.attributes.order.tax') }
  let(:note) { I18n.t('activerecord.attributes.order.note') }
  let(:tracking_no) { I18n.t('activerecord.attributes.order.tracking_no') }
  let(:created_at) { I18n.t('activerecord.attributes.order.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.order.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('order.id')).to eq id
    expect(AttrValue.attr('order.ordered_on')).to eq ordered_on
    expect(AttrValue.attr('order.user_id')).to eq user_id
    expect(AttrValue.attr('order.payment_status')).to eq payment_status
    expect(AttrValue.attr('order.fulfillment_status')).to eq fulfillment_status
    expect(AttrValue.attr('order.total_amount')).to eq total_amount
    expect(AttrValue.attr('order.shipping_cost')).to eq shipping_cost
    expect(AttrValue.attr('order.tax')).to eq tax
    expect(AttrValue.attr('order.note')).to eq note
    expect(AttrValue.attr('order.tracking_no')).to eq tracking_no
    expect(AttrValue.attr('order.created_at')).to eq created_at
    expect(AttrValue.attr('order.updated_at')).to eq updated_at
  end
end
