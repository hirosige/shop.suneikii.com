# == Schema Information
#
# Table name: payment_methods
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  account_number :integer
#  account_name   :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Color' do
  let(:id) { I18n.t('activerecord.attributes.payment_method.id') }
  let(:name) { I18n.t('activerecord.attributes.payment_method.name') }
  let(:account_number) { I18n.t('activerecord.attributes.payment_method.account_number') }
  let(:account_name) { I18n.t('activerecord.attributes.payment_method.account_name') }
  let(:created_at) { I18n.t('activerecord.attributes.payment_method.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.payment_method.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('payment_method.id')).to eq id
    expect(AttrValue.attr('payment_method.name')).to eq name
    expect(AttrValue.attr('payment_method.account_number')).to eq account_number
    expect(AttrValue.attr('payment_method.account_name')).to eq account_name
    expect(AttrValue.attr('payment_method.created_at')).to eq created_at
    expect(AttrValue.attr('payment_method.updated_at')).to eq updated_at
  end
end
