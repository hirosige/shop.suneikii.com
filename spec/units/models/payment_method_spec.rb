# == Schema Information
#
# Table name: payment_methods
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  account_number :integer
#  account_name   :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
end
