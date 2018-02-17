# == Schema Information
#
# Table name: size_selections
#
#  id         :integer          not null, primary key
#  size_id    :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Size, type: :model do
  it "can create" do
    size = build(:size, :s)
    expect(size.validate).to eq true
  end
end
