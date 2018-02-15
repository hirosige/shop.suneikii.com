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

require 'rails_helper'

RSpec.describe CollectionConnection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
