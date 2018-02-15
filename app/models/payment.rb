# == Schema Information
#
# Table name: payments
#
#  id                :integer          not null, primary key
#  order_id          :integer
#  payment_method_id :integer
#  evidence          :string(255)
#  paid_at           :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :payment_method
end
