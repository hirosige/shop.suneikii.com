# == Schema Information
#
# Table name: sites
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  email            :string(255)
#  tel1             :string(255)
#  tel2             :string(255)
#  address          :text(65535)
#  privacy_policy   :text(65535)
#  condition_of_use :text(65535)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Site, type: :model do
end
