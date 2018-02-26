# == Schema Information
#
# Table name: personal_questions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  user_id     :integer
#  status      :string(255)
#  answer      :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe 'Attr PersonalQuestion' do
  let(:id) { I18n.t('activerecord.attributes.personal_question.id') }
  let(:title) { I18n.t('activerecord.attributes.personal_question.title') }
  let(:description) { I18n.t('activerecord.attributes.personal_question.description') }
  let(:user_id) { I18n.t('activerecord.attributes.personal_question.user_id') }
  let(:status) { I18n.t('activerecord.attributes.personal_question.status') }
  let(:answer) { I18n.t('activerecord.attributes.personal_question.answer') }
  let(:created_at) { I18n.t('activerecord.attributes.personal_question.created_at') }
  let(:updated_at) { I18n.t('activerecord.attributes.personal_question.updated_at') }

  it 'can get cap' do
    expect(AttrValue.attr('personal_question.id')).to eq id
    expect(AttrValue.attr('personal_question.title')).to eq title
    expect(AttrValue.attr('personal_question.description')).to eq description
    expect(AttrValue.attr('personal_question.user_id')).to eq user_id
    expect(AttrValue.attr('personal_question.status')).to eq status
    expect(AttrValue.attr('personal_question.answer')).to eq answer
    expect(AttrValue.attr('personal_question.created_at')).to eq created_at
    expect(AttrValue.attr('personal_question.updated_at')).to eq updated_at
  end
end
