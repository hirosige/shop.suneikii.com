# == Schema Information
#
# Table name: cart_contents
#
#  id         :integer          not null, primary key
#  good_id    :integer
#  pts        :integer
#  sub_amount :decimal(16, 3)
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartContent < ApplicationRecord
  validates :good_id,    presence: true
  validates :pts,        presence: true
  validates :sub_amount, presence: true
  validates :cart_id,    presence: true
  validates :good_id, uniqueness: { scope: :cart_id }
  validate :pts_should_be_more_than_zero

  belongs_to :good
  belongs_to :cart

  def pts_should_be_more_than_zero
    if self.pts.present? && self.pts <= 0
      errors.add(:pts, "can't be zero and less")
    end
  end

  def calc_sub_amount
    self.sub_amount = self.good.price * self.pts
  end

  def change_quantity(pts)
    if pts <= 0
      errors.add(:pts, "can't input 0 and less for quantity")
    else
      self.pts = pts
      self.calc_sub_amount
      save
    end
  end
end
