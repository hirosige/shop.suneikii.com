# == Schema Information
#
# Table name: good_images
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe GoodImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
