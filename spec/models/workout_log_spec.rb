require "rails_helper"

RSpec.describe WorkoutLog, type: :model do
  it "is valid with a user and workout" do
    workout_log = build(:workout_log)
    expect(workout_log).to be_valid
  end

  it "belongs to a user" do
    association = WorkoutLog.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it "belongs to a workout" do
    association = WorkoutLog.reflect_on_association(:workout)
    expect(association.macro).to eq(:belongs_to)
  end

  describe ".completed" do
    it "returns only logs with a completed_at timestamp" do
      completed_log = create(:workout_log, completed_at: Time.current)
      incomplete_log = create(:workout_log, completed_at: nil)

      expect(WorkoutLog.completed).to include(completed_log)
      expect(WorkoutLog.completed).not_to include(incomplete_log)
    end
  end
end