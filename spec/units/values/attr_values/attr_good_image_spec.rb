# == Schema Information
#
# Table name: good_images
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Color' do
  let(:id) { I18n.t('activerecord.attributes.good_image.id') }
  let(:image) { I18n.t('activerecord.attributes.good_image.image') }
  let(:good_id) { I18n.t('activerecord.attributes.good_image.good_id') }
  let(:created_at) { I18n.t('activerecord.attributes.good_image.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.good_image.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('good_image.id')).to eq id
    expect(AttrValue.attr('good_image.image')).to eq image
    expect(AttrValue.attr('good_image.good_id')).to eq good_id
    expect(AttrValue.attr('good_image.created_at')).to eq created_at
    expect(AttrValue.attr('good_image.updated_at')).to eq updated_at
  end
end
