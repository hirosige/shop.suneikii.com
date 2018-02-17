# == Schema Information
#
# Table name: shoppers
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  photo               :string(255)
#  representative_name :string(255)
#  postal_code         :string(255)
#  address             :text(65535)
#  tel1                :string(255)
#  tel2                :string(255)
#  email               :string(255)
#  status              :integer
#  memo                :text(65535)
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#


require 'rails_helper'

RSpec.describe Shopper, type: :model do
end
