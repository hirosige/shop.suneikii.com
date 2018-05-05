# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  good_id    :integer
#  pts        :integer
#  sub_amount :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderDetail < ApplicationRecord
  include TotalCalcable

  before_save :calc_sub_amount

  belongs_to :order
  belongs_to :good

end
