# == Schema Information
#
# Table name: distributors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  tel        :string(255)
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Distributor < ApplicationRecord
  validates :name,    presence: true, length: { maximum: 255 }, uniqueness: true
  validates :tel,     presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
end
