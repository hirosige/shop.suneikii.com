# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Color' do
  let(:id) { I18n.t('activerecord.attributes.ingredient.id') }
  let(:name) { I18n.t('activerecord.attributes.ingredient.name') }
  let(:created_at) { I18n.t('activerecord.attributes.ingredient.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.ingredient.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('ingredient.id')).to eq id
    expect(AttrValue.attr('ingredient.name')).to eq name
    expect(AttrValue.attr('ingredient.created_at')).to eq created_at
    expect(AttrValue.attr('ingredient.updated_at')).to eq updated_at
  end
end
