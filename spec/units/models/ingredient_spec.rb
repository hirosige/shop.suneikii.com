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

  it 'can create ingredient' do
    ingredient = build(:ingredient, :milk)
    expect(ingredient.valid?).to eq true
  end

  it 'ingredient should be required' do
    ingredient = build(:ingredient, :blank_name)
    expect(ingredient.valid?).to eq false
  end

  it 'ingredient should be less than 256' do
    ingredient = build(:ingredient, :name_is_too_long)
    expect(ingredient.valid?).to eq false
  end
end
