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
  include TotalCalcable

  validates :good_id,    presence: true
  validates :pts,        presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :sub_amount, presence: true
  validates :cart_id,    presence: true
  validates :good_id, uniqueness: { scope: :cart_id }

  belongs_to :good
  belongs_to :cart

end
