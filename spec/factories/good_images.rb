# == Schema Information
#
# Table name: good_images
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  good_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :good_image do |good_image|
    good_image.trait :img1 do |item|
      file_name = 'spec/factories/docs/test.png'
      item.image { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.association :good, factory: %i[good a]
    end

    good_image.trait :can_upload_png do |item|
      file_name = 'spec/factories/docs/test.png'
      item.image { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.association :good, factory: %i[good a]
    end

    good_image.trait :can_upload_jpg do |item|
      file_name = 'spec/factories/docs/test.jpg'
      item.image { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.association :good, factory: %i[good a]
    end

    good_image.trait :can_upload_jpeg do |item|
      file_name = 'spec/factories/docs/test.jpeg'
      item.image { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.association :good, factory: %i[good a]
    end

    good_image.trait :can_upload_gif do |item|
      file_name = 'spec/factories/docs/test.gif'
      item.image { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.association :good, factory: %i[good a]
    end

    good_image.trait :can_upload_pdf do |item|
      file_name = 'spec/factories/docs/test.pdf'
      item.image { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.association :good, factory: %i[good a]
    end
  end
end
