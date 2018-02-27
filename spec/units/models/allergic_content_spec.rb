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

RSpec.describe AllergicContent, type: :model do
  let(:mdl) { 'allergic_content' }
  let(:ingredient_id) { AttrValue.attr("#{mdl}.ingredient_id") }
  let(:good_id) { AttrValue.attr("#{mdl}.good_id") }

  it 'can create' do
    allergic_content = build(:allergic_content, :a_shrimp)
    expect(allergic_content.valid?).to eq true
  end

  it 'ingredient is required' do
    allergic_content = build(:allergic_content, :ingredient_nil)
    expect(allergic_content.valid?).to eq false
    expect(allergic_content.errors.full_messages).to include must_exist(ingredient_id)
  end

  it 'good is required' do
    allergic_content = build(:allergic_content, :good_nil)
    expect(allergic_content.valid?).to eq false
    expect(allergic_content.errors.full_messages).to include must_exist(good_id)
  end

  it 'ingredient and good set should be unique' do
    allergic_content = create(:allergic_content, :a_shrimp)
    allergic_content = build(:allergic_content, :a_shrimp, good_id: allergic_content.good_id, ingredient_id: allergic_content.ingredient_id)
    expect(allergic_content.valid?).to eq false
    expect(allergic_content.errors.full_messages).to include taken_err_msg_with(ingredient_id, good_id)
  end
end
