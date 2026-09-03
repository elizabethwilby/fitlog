FactoryBot.define do
  factory :workout_exercise do
    sets { 3 }
    reps { 10 }
    weight { 50 }
    association :workout
    association :exercise
  end
end