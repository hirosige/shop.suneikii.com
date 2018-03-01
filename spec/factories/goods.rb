# == Schema Information
#
# Table name: goods
#
#  id                :integer          not null, primary key
#  shopper_id        :integer
#  goods_category_id :integer
#  name              :string(255)
#  thumbnail         :string(255)
#  price             :decimal(10, 2)
#  description       :string(255)
#  gender            :integer
#  admin_memo        :text(65535)
#  status            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :good do |good|
    good.trait :a do |item|
      file_name = 'spec/factories/docs/test.png'
      item.association :shopper, factory: %i[shopper a]
      item.association :goods_category, factory: %i[goods_category soap]
      item.name "good_a"
      item.thumbnail { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.price 2000.0
      item.description "test"
      item.gender 0
      item.admin_memo "test"
    end

    good.trait :b do |item|
      file_name = 'spec/factories/docs/test.png'
      item.association :shopper, factory: %i[shopper a]
      item.association :goods_category, factory: %i[goods_category soap]
      item.name "good_a"
      item.thumbnail { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.price 3000.0
      item.description "test"
      item.gender 0
      item.admin_memo "test"
    end

    good.trait :blank_shopper do |item|
      file_name = 'spec/factories/docs/test.png'
      item.association :goods_category, factory: %i[goods_category soap]
      item.name "good_a"
      item.thumbnail { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.price 3000.0
      item.description "test"
      item.gender 0
      item.admin_memo "test"
    end

    good.trait :blank_goods_category do |item|
      file_name = 'spec/factories/docs/test.png'
      item.association :shopper, factory: %i[shopper a]
      item.name "good_a"
      item.thumbnail { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.price 3000.0
      item.description "test"
      item.gender 0
      item.admin_memo "test"
    end

    good.trait :blank_name do |item|
      file_name = 'spec/factories/docs/test.png'
      item.association :shopper, factory: %i[shopper a]
      item.association :goods_category, factory: %i[goods_category soap]
      item.thumbnail { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.price 3000.0
      item.description "test"
      item.gender 0
      item.admin_memo "test"
    end

    good.trait :blank_thumbnail do |item|
      item.association :shopper, factory: %i[shopper a]
      item.association :goods_category, factory: %i[goods_category soap]
      item.name "good_a"
      item.price 3000.0
      item.description "test"
      item.gender 0
      item.admin_memo "test"
    end

    good.trait :blank_price do |item|
      file_name = 'spec/factories/docs/test.png'
      item.association :shopper, factory: %i[shopper a]
      item.association :goods_category, factory: %i[goods_category soap]
      item.name "good_a"
      item.thumbnail { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.description "test"
      item.gender 0
      item.admin_memo "test"
    end

    good.trait :blank_gender do |item|
      file_name = 'spec/factories/docs/test.png'
      item.association :shopper, factory: %i[shopper a]
      item.association :goods_category, factory: %i[goods_category soap]
      item.name "good_a"
      item.thumbnail { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.price 3000.0
      item.description "test"
      item.admin_memo "test"
    end

    good.trait :name_is_too_long do |item|
      file_name = 'spec/factories/docs/test.png'
      too_long_name = "M" * 256
      item.association :shopper, factory: %i[shopper a]
      item.association :goods_category, factory: %i[goods_category soap]
      item.name too_long_name
      item.thumbnail { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.price 2000.0
      item.description "test"
      item.gender 0
      item.admin_memo "test"
    end

    good.trait :desc_is_too_long do |item|
      file_name = 'spec/factories/docs/test.png'
      too_long_desc = "M" * 256
      item.association :shopper, factory: %i[shopper a]
      item.association :goods_category, factory: %i[goods_category soap]
      item.name 'good_a'
      item.thumbnail { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.price 2000.0
      item.description too_long_desc
      item.gender 0
      item.admin_memo "test"
    end

    good.trait :admin_memo_is_too_long do |item|
      file_name = 'spec/factories/docs/test.png'
      too_long_admin_memo = "M" * 65536
      item.association :shopper, factory: %i[shopper a]
      item.association :goods_category, factory: %i[goods_category soap]
      item.name 'good_a'
      item.thumbnail { Rack::Test::UploadedFile.new(File.join(Rails.root, file_name)) }
      item.price 2000.0
      item.description 'description'
      item.gender 0
      item.admin_memo too_long_admin_memo
    end
  end
end
