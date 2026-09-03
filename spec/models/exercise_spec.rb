require "rails_helper"

RSpec.describe Exercise, type: :model do
  it "is valid with a name and category" do
    exercise = build(:exercise)
    expect(exercise).to be_valid
  end

  it "is invalid without a name" do
    exercise = build(:exercise, name: nil)
    expect(exercise).not_to be_valid
  end

  it "has many workout_exercises" do
    association = Exercise.reflect_on_association(:workout_exercises)
    expect(association.macro).to eq(:has_many)
  end
end