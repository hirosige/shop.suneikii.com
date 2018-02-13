# == Schema Information
#
# Table name: profiles
#
#  id             :integer          not null, primary key
#  photo          :string(255)
#  postal_code    :string(255)
#  address        :text(65535)
#  tel            :string(255)
#  reciever_email :string(255)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :photo, ProfilePhotoUploader
end
