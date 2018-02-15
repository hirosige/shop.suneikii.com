# == Schema Information
#
# Table name: personal_questions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  user_id     :integer
#  status      :string(255)
#  answer      :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PersonalQuestion < ApplicationRecord
  belongs_to :user
end
