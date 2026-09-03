require "rails_helper"

RSpec.describe WorkoutExercise, type: :model do
  it "is valid with a workout and exercise" do
    workout_exercise = build(:workout_exercise)
    expect(workout_exercise).to be_valid
  end

  it "belongs to a workout" do
    association = WorkoutExercise.reflect_on_association(:workout)
    expect(association.macro).to eq(:belongs_to)
  end

  it "belongs to an exercise" do
    association = WorkoutExercise.reflect_on_association(:exercise)
    expect(association.macro).to eq(:belongs_to)
  end

  it "is invalid with negative sets" do
    workout_exercise = build(:workout_exercise, sets: -1)
    expect(workout_exercise).not_to be_valid
  end

  it "is valid with sets left blank" do
    workout_exercise = build(:workout_exercise, sets: nil)
    expect(workout_exercise).to be_valid
  end
end