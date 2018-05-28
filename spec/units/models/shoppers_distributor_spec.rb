# == Schema Information
#
# Table name: shoppers_distributors
#
#  id             :integer          not null, primary key
#  shopper_id     :integer
#  distributor_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe ShoppersDistributor, type: :model do
end
