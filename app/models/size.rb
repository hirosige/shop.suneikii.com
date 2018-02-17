# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Size < ApplicationRecord
  has_many :size_selections
  has_many :goods, through: :size_selections

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
end
