# == Schema Information
#
# Table name: goods
#
#  id                :integer          not null, primary key
#  shopper_id        :integer
#  goods_category_id :integer
#  name              :string(255)
#  thumbnail         :string(255)
#  price             :decimal(10, 2)
#  description       :string(255)
#  gender            :integer
#  admin_memo        :text(65535)
#  status            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null

require 'rails_helper'

RSpec.describe 'Attr Color' do
  let(:id) { I18n.t('activerecord.attributes.good.id') }
  let(:shopper_id) { I18n.t('activerecord.attributes.good.shopper_id') }
  let(:goods_category_id) { I18n.t('activerecord.attributes.good.goods_category_id') }
  let(:name) { I18n.t('activerecord.attributes.good.name') }
  let(:thumbnail) { I18n.t('activerecord.attributes.good.thumbnail') }
  let(:price) { I18n.t('activerecord.attributes.good.price') }
  let(:description) { I18n.t('activerecord.attributes.good.description') }
  let(:gender) { I18n.t('activerecord.attributes.good.gender') }
  let(:admin_memo) { I18n.t('activerecord.attributes.good.admin_memo') }
  let(:status) { I18n.t('activerecord.attributes.good.status') }
  let(:created_at) { I18n.t('activerecord.attributes.good.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.good.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('good.id')).to eq id
    expect(AttrValue.attr('good.shopper_id')).to eq shopper_id
    expect(AttrValue.attr('good.goods_category_id')).to eq goods_category_id
    expect(AttrValue.attr('good.name')).to eq name
    expect(AttrValue.attr('good.thumbnail')).to eq thumbnail
    expect(AttrValue.attr('good.price')).to eq price
    expect(AttrValue.attr('good.description')).to eq description
    expect(AttrValue.attr('good.gender')).to eq gender
    expect(AttrValue.attr('good.admin_memo')).to eq admin_memo
    expect(AttrValue.attr('good.status')).to eq status
    expect(AttrValue.attr('good.created_at')).to eq created_at
    expect(AttrValue.attr('good.updated_at')).to eq updated_at
  end
end
