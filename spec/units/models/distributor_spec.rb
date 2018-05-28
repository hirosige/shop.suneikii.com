# == Schema Information
#
# Table name: distributors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  tel        :string(255)
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Distributor, type: :model do
  let(:mdl) { 'distributor' }
  let(:name) { AttrValue.attr("#{mdl}.name") }
  let(:tel) { AttrValue.attr("#{mdl}.tel") }
  let(:address) { AttrValue.attr("#{mdl}.address") }

  it 'can create' do
    distributor = build(:distributor, :ups)
    expect(distributor.valid?).to eq true
  end

  it 'name should be required' do
    distributor = build(:distributor, :blank_name)
    expect(distributor.valid?).to eq false
    expect(distributor.errors.full_messages).to include blank_err_msg(name)
  end

  it 'name should be required' do
    distributor = build(:distributor, :blank_tel)
    expect(distributor.valid?).to eq false
    expect(distributor.errors.full_messages).to include blank_err_msg(tel)
  end

  it 'name should be required' do
    distributor = build(:distributor, :blank_address)
    expect(distributor.valid?).to eq false
    expect(distributor.errors.full_messages).to include blank_err_msg(address)
  end

  it 'name is too long' do
    distributor = build(:distributor, :name_is_too_long)
    expect(distributor.valid?).to eq false
    expect(distributor.errors.full_messages).to include too_long_err_msg(name, 255)
  end

  it 'tel is too long' do
    distributor = build(:distributor, :tel_is_too_long)
    expect(distributor.valid?).to eq false
    expect(distributor.errors.full_messages).to include too_long_err_msg(tel, 255)
  end

  it 'tel is too long' do
    distributor = build(:distributor, :address_is_too_long)
    expect(distributor.valid?).to eq false
    expect(distributor.errors.full_messages).to include too_long_err_msg(address, 255)
  end

  it 'name should be unique fail' do
    create(:distributor, :unique_chk_fail)
    distributor = build(:distributor, :unique_chk_fail)
    expect(distributor.valid?).to eq false
    expect(distributor.errors.full_messages).to include taken_err_msg(name)
  end

  it 'name should be unique fail' do
    create(:distributor, :unique_chk_fail)
    distributor = build(:distributor, :unique_chk_success)
    expect(distributor.valid?).to eq true
    expect(distributor.errors.full_messages.size).to eq 0
  end
end
