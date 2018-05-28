# == Schema Information
#
# Table name: carts
#
#  id           :integer          not null, primary key
#  total_amount :decimal(16, 3)
#  status       :string(255)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Cart' do
  let(:id) { I18n.t('activerecord.attributes.cart.id') }
  let(:total_amount) { I18n.t('activerecord.attributes.cart.total_amount') }
  let(:status) { I18n.t('activerecord.attributes.cart.status') }
  let(:user_id) { I18n.t('activerecord.attributes.cart.user_id') }
  let(:created_at) { I18n.t('activerecord.attributes.cart.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.cart.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('cart.id')).to eq id
    expect(AttrValue.attr('cart.total_amount')).to eq total_amount
    expect(AttrValue.attr('cart.status')).to eq status
    expect(AttrValue.attr('cart.user_id')).to eq user_id
    expect(AttrValue.attr('cart.created_at')).to eq created_at
    expect(AttrValue.attr('cart.updated_at')).to eq updated_at
  end
end
