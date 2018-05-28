# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  good_id     :integer
#  rates       :decimal(2, 1)
#  description :text(65535)
#  status      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr PersonalQuestion' do
  let(:id) { I18n.t('activerecord.attributes.rating.id') }
  let(:user_id) { I18n.t('activerecord.attributes.rating.user_id') }
  let(:good_id) { I18n.t('activerecord.attributes.rating.good_id') }
  let(:rates) { I18n.t('activerecord.attributes.rating.rates') }
  let(:description) { I18n.t('activerecord.attributes.rating.description') }
  let(:status) { I18n.t('activerecord.attributes.rating.status') }
  let(:created_at) { I18n.t('activerecord.attributes.rating.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.rating.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('rating.id')).to eq id
    expect(AttrValue.attr('rating.user_id')).to eq user_id
    expect(AttrValue.attr('rating.good_id')).to eq good_id
    expect(AttrValue.attr('rating.rates')).to eq rates
    expect(AttrValue.attr('rating.description')).to eq description
    expect(AttrValue.attr('rating.status')).to eq status
    expect(AttrValue.attr('rating.created_at')).to eq created_at
    expect(AttrValue.attr('rating.updated_at')).to eq updated_at
  end
end
