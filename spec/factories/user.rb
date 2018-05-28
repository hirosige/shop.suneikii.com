FactoryBot.define do
  factory :user do |user|
    user.trait :user1 do |item|
      item.email "1#{Faker::Internet.email}"
    end

    user.trait :user2 do |item|
      item.email "2#{Faker::Internet.email}"
    end

    user.trait :user3 do |item|
      item.email "3#{Faker::Internet.email}"
    end

    user.trait :me do |item|
      item.email "99#{Faker::Internet.email}"
    end

    user.password 'abCD1234'
    user.password_confirmation 'abCD1234'
    user.role :admin
    user.confirmed_at Time.now
  end
end