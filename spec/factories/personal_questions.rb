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

FactoryBot.define do
  factory :personal_question do
    title "MyString"
    description "MyText"
    user_id 1
    status "MyString"
    answer "MyText"
  end
end
