# == Schema Information
#
# Table name: colors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe 'Attr Color' do
  let(:id) { I18n.t('activerecord.attributes.color.id') }
  let(:name) { I18n.t('activerecord.attributes.color.name') }
  let(:created_at) { I18n.t('activerecord.attributes.color.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.color.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('color.id')).to eq id
    expect(AttrValue.attr('color.name')).to eq name
    expect(AttrValue.attr('color.created_at')).to eq created_at
    expect(AttrValue.attr('color.updated_at')).to eq updated_at
  end
end
