# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Site' do
  let(:id) { I18n.t('activerecord.attributes.size.id') }
  let(:name) { I18n.t('activerecord.attributes.size.name') }
  let(:created_at) { I18n.t('activerecord.attributes.size.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.size.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('size.id')).to eq id
    expect(AttrValue.attr('size.name')).to eq name
    expect(AttrValue.attr('size.created_at')).to eq created_at
    expect(AttrValue.attr('size.updated_at')).to eq updated_at
  end
end
