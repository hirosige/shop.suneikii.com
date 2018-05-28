# == Schema Information
#
# Table name: color_selections
#
#  id         :integer          not null, primary key
#  color_id   :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ColorSelection < ApplicationRecord
  belongs_to :color
  belongs_to :good
end
