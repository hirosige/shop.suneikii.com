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

require 'rails_helper'

RSpec.describe ColorSelection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
