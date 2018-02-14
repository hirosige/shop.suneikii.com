# == Schema Information
#
# Table name: collections
#
#  id            :integer          not null, primary key
#  start_at      :datetime
#  end_at        :datetime
#  discount_rate :decimal(5, 2)
#  status        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Collection < ApplicationRecord
end
