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

class AllergicContent < ApplicationRecord
  validates :ingredient_id, uniqueness: { scope: :good_id }

  belongs_to :ingredient
  belongs_to :good
end
