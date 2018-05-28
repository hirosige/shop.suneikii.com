# == Schema Information
#
# Table name: goods_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Color' do
  let(:id) { I18n.t('activerecord.attributes.good_category.id') }
  let(:name) { I18n.t('activerecord.attributes.good_category.name') }
  let(:created_at) { I18n.t('activerecord.attributes.good_category.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.good_category.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('good_category.id')).to eq id
    expect(AttrValue.attr('good_category.name')).to eq name
    expect(AttrValue.attr('good_category.created_at')).to eq created_at
    expect(AttrValue.attr('good_category.updated_at')).to eq updated_at
  end
end
