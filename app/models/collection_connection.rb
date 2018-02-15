# == Schema Information
#
# Table name: collection_connections
#
#  id            :integer          not null, primary key
#  collection_id :integer
#  good_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CollectionConnection < ApplicationRecord
  belongs_to :good
  belongs_to :collection
end
