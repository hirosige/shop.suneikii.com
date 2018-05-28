# == Schema Information
#
# Table name: shoppers_distributors
#
#  id             :integer          not null, primary key
#  shopper_id     :integer
#  distributor_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe 'Attr ShopperDistributor' do
  let(:id) { I18n.t('activerecord.attributes.shoppers_distributor.id') }
  let(:shopper_id) { I18n.t('activerecord.attributes.shoppers_distributor.shopper_id') }
  let(:distributor_id) { I18n.t('activerecord.attributes.shoppers_distributor.distributor_id') }
  let(:created_at) { I18n.t('activerecord.attributes.shoppers_distributor.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.shoppers_distributor.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('shoppers_distributor.id')).to eq id
    expect(AttrValue.attr('shoppers_distributor.shopper_id')).to eq shopper_id
    expect(AttrValue.attr('shoppers_distributor.distributor_id')).to eq distributor_id
    expect(AttrValue.attr('shoppers_distributor.created_at')).to eq created_at
    expect(AttrValue.attr('shoppers_distributor.updated_at')).to eq updated_at
  end
end
