# == Schema Information
#
# Table name: size_selections
#
#  id         :integer          not null, primary key
#  size_id    :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


require 'rails_helper'

RSpec.describe 'Attr Site' do
  let(:id) { I18n.t('activerecord.attributes.size_selection.id') }
  let(:size_id) { I18n.t('activerecord.attributes.size_selection.size_id') }
  let(:good_id) { I18n.t('activerecord.attributes.size_selection.good_id') }
  let(:created_at) { I18n.t('activerecord.attributes.size_selection.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.size_selection.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('size_selection.id')).to eq id
    expect(AttrValue.attr('size_selection.size_id')).to eq size_id
    expect(AttrValue.attr('size_selection.good_id')).to eq good_id
    expect(AttrValue.attr('size_selection.created_at')).to eq created_at
    expect(AttrValue.attr('size_selection.updated_at')).to eq updated_at
  end
end
