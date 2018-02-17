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

require 'rails_helper'

RSpec.describe Payment, type: :model do
end
