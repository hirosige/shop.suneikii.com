# == Schema Information
#
# Table name: wish_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr Site' do
  let(:id) { I18n.t('activerecord.attributes.wish_list.id') }
  let(:user_id) { I18n.t('activerecord.attributes.wish_list.user_id') }
  let(:good_id) { I18n.t('activerecord.attributes.wish_list.good_id') }
  let(:created_at) { I18n.t('activerecord.attributes.wish_list.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.wish_list.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('wish_list.id')).to eq id
    expect(AttrValue.attr('wish_list.user_id')).to eq user_id
    expect(AttrValue.attr('wish_list.good_id')).to eq good_id
    expect(AttrValue.attr('wish_list.created_at')).to eq created_at
    expect(AttrValue.attr('wish_list.updated_at')).to eq updated_at
  end
end
