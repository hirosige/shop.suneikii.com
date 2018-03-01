# == Schema Information
#
# Table name: colors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Color Model
class Color < ApplicationRecord
  has_many :color_selections
  has_many :goods, through: :color_selections

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
end
