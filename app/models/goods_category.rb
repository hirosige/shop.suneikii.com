# == Schema Information
#
# Table name: goods_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GoodsCategory < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }

  has_many :goods
end
