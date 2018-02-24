# == Schema Information
#
# Table name: color_selections
#
#  id         :integer          not null, primary key
#  color_id   :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr ColorSelection' do
  let(:id) { I18n.t('activerecord.attributes.color_selection.id') }
  let(:color_id) { I18n.t('activerecord.attributes.color_selection.color_id') }
  let(:good_id) { I18n.t('activerecord.attributes.color_selection.good_id') }
  let(:created_at) { I18n.t('activerecord.attributes.color_selection.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.color_selection.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('color_selection.id')).to eq id
    expect(AttrValue.attr('color_selection.color_id')).to eq color_id
    expect(AttrValue.attr('color_selection.good_id')).to eq good_id
    expect(AttrValue.attr('color_selection.created_at')).to eq created_at
    expect(AttrValue.attr('color_selection.updated_at')).to eq updated_at
  end
end
