# == Schema Information
#
# Table name: wash_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WishList < ApplicationRecord
  validates :good_id, :presence => true
  validates :good_id, :uniqueness => { :scope => :user_id }

  belongs_to :user
  belongs_to :good
end
