# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:mdl) { 'ingredient' }
  let(:name) { AttrValue.attr("#{mdl}.name") }

  it 'can create ingredient' do
    ingredient = build(:ingredient, :milk)
    expect(ingredient.valid?).to eq true
  end

  it 'ingredient should be required' do
    ingredient = build(:ingredient, :blank_name)
    expect(ingredient.valid?).to eq false
    expect(ingredient.errors.full_messages).to include blank_err_msg(name)
  end

  it 'name is too long' do
    ingredient = build(:ingredient, :name_is_too_long)
    expect(ingredient.valid?).to eq false
    expect(ingredient.errors.full_messages).to include too_long_err_msg(name, 255)
  end

  it 'name should be unique fail' do
    create(:ingredient, :unique_chk_fail)
    ingredient = build(:ingredient, :unique_chk_fail)
    expect(ingredient.valid?).to eq false
    expect(ingredient.errors.full_messages).to include taken_err_msg(name)
  end

  it 'name should be unique success' do
    create(:ingredient, :unique_chk_fail)
    ingredient = build(:ingredient, :unique_chk_success)
    expect(ingredient.valid?).to eq true
    expect(ingredient.errors.full_messages.size).to eq 0
  end
end
