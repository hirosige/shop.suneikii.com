# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  good_id     :integer
#  rates       :decimal(2, 1)
#  description :text(65535)
#  status      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :good
end
