# == Schema Information
#
# Table name: collections
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  start_at      :datetime
#  end_at        :datetime
#  discount_rate :decimal(5, 2)
#  status        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Collection < ApplicationRecord
  validates :name,          presence: true, length: { maximum: 255 }
  validates :start_at,      presence: true
  validates :end_at,        presence: true
  validates :discount_rate, presence: true, numericality: true
  validates_datetime :start_at, :on_or_after => :today
  validates_datetime :end_at, after: :start_at

  has_many :collection_connections
  has_many :goods, through: :collection_connections
end
