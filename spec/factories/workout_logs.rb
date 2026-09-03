FactoryBot.define do
  factory :workout_log do
    completed_at { Time.current }
    notes { "Felt good" }
    association :user
    association :workout
  end
end