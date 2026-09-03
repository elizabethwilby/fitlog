FactoryBot.define do
  factory :workout do
    name { "Test Workout" }
    notes { "Some notes" }
    association :user
  end
end