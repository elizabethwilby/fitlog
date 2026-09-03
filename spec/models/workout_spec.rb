require "rails_helper"

RSpec.describe Workout, type: :model do
  it "is valid with a name and user" do
    workout = build(:workout)
    expect(workout).to be_valid
  end

  it "is invalid without a name" do
    workout = build(:workout, name: nil)
    expect(workout).not_to be_valid
  end

  it "belongs to a user" do
    association = Workout.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it "has many workout_exercises" do
    association = Workout.reflect_on_association(:workout_exercises)
    expect(association.macro).to eq(:has_many)
  end

  it "destroys associated workout_exercises when destroyed" do
    workout = create(:workout)
    create(:workout_exercise, workout: workout)
    expect { workout.destroy }.to change(WorkoutExercise, :count).by(-1)
  end
end