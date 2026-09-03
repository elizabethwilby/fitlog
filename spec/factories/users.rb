FactoryBot.define do
  factory :user do
    username { "TestUser" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "Password1" }
  end
end