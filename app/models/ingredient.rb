# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ApplicationRecord
  has_many :allergic_contents
  has_many :goods, through: :allergic_contents

  validates :name, presence: true, length: { maximum: 255 }
end
