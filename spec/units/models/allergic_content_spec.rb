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

  it 'can create' do
    allergic_content = build(:allergic_content, :a_shrimp)
    expect(allergic_content.valid?).to eq true
  end

  it 'can create two' do
    good = create(:good, :a)
    create(:allergic_content, :a_shrimp, good_id: good.id)
    create(:allergic_content, :a_milk, good_id: good.id)

    expect(Good.find(good.id).ingredients.size).to eq 2
  end

  it 'ingredient is required' do
    allergic_content = build(:allergic_content, :ingredient_nil)
    expect(allergic_content.valid?).to eq false
  end

  it 'good is required' do
    allergic_content = build(:allergic_content, :good_nil)
    expect(allergic_content.valid?).to eq false
  end

  it 'ingredient and good set should be unique' do
    good = create(:good, :a)
    ingredient = create(:ingredient, :shrimp)
    create(:allergic_content, :a_shrimp, good_id: good.id, ingredient_id: ingredient.id)
    allergic_content = build(:allergic_content, :a_shrimp, good_id: good.id, ingredient_id: ingredient.id)
    expect(allergic_content.valid?).to eq false
  end
end
