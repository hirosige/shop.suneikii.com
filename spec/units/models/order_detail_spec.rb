# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  good_id    :integer
#  qty        :integer
#  sub_total  :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
end
