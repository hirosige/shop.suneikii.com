# == Schema Information
#
# Table name: allergic_contents
#
#  id            :integer          not null, primary key
#  ingredient_id :integer
#  good_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr AllergicContent' do
  let(:id) { I18n.t('activerecord.attributes.allergic_content.id') }
  let(:ingredient_id) { I18n.t('activerecord.attributes.allergic_content.ingredient_id') }
  let(:good_id) { I18n.t('activerecord.attributes.allergic_content.good_id') }
  let(:created_at) { I18n.t('activerecord.attributes.allergic_content.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.allergic_content.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('allergic_content.id')).to eq id
    expect(AttrValue.attr('allergic_content.ingredient_id')).to eq ingredient_id
    expect(AttrValue.attr('allergic_content.good_id')).to eq good_id
    expect(AttrValue.attr('allergic_content.created_at')).to eq created_at
    expect(AttrValue.attr('allergic_content.updated_at')).to eq updated_at
  end
end
