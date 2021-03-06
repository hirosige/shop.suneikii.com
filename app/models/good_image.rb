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

class GoodImage < ApplicationRecord
  belongs_to :good

  mount_uploader :image, GoodImagesUploader
end
