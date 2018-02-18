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
  has_many :collection_connections
  has_many :goods, through: :collection_connections
end
