# == Schema Information
#
# Table name: payments
#
#  id                :integer          not null, primary key
#  order_id          :integer
#  payment_method_id :integer
#  evidence          :string(255)
#  paid_at           :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Color' do
  let(:id) { I18n.t('activerecord.attributes.payment.id') }
  let(:order_id) { I18n.t('activerecord.attributes.payment.order_id') }
  let(:payment_method_id) { I18n.t('activerecord.attributes.payment.payment_method_id') }
  let(:evidence) { I18n.t('activerecord.attributes.payment.evidence') }
  let(:paid_at) { I18n.t('activerecord.attributes.payment.paid_at') }
  let(:created_at) { I18n.t('activerecord.attributes.payment.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.payment.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('payment.id')).to eq id
    expect(AttrValue.attr('payment.order_id')).to eq order_id
    expect(AttrValue.attr('payment.payment_method_id')).to eq payment_method_id
    expect(AttrValue.attr('payment.evidence')).to eq evidence
    expect(AttrValue.attr('payment.paid_at')).to eq paid_at
    expect(AttrValue.attr('payment.created_at')).to eq created_at
    expect(AttrValue.attr('payment.updated_at')).to eq updated_at
  end
end
