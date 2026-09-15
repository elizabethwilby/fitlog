# frozen_string_literal: true

require "rails_helper"

RSpec.describe WorkoutExerciseComponent, type: :component do
  let(:exercise) { create(:exercise, name: "Bench Press") }

  it "renders the exercise name" do
    workout_exercise = create(:workout_exercise, exercise: exercise)

    render_inline(described_class.new(workout_exercise: workout_exercise))

    expect(page).to have_text("Bench Press")
  end

  it "renders sets, reps, and weight when present" do
    workout_exercise = create(:workout_exercise, exercise: exercise, sets: 3, reps: 10, weight: 135)

    render_inline(described_class.new(workout_exercise: workout_exercise))

    expect(page).to have_text("3 sets x 10 reps")
    expect(page).to have_text("@ 135.0 lbs")
  end

  it "renders duration when present instead of sets" do
    workout_exercise = create(:workout_exercise, exercise: exercise, sets: nil, reps: nil, weight: nil, duration_minutes: 20)

    render_inline(described_class.new(workout_exercise: workout_exercise))

    expect(page).to have_text("20 min")
    expect(page).not_to have_text("sets x")
  end

  it "renders distance when present" do
    workout_exercise = create(:workout_exercise, exercise: exercise, sets: nil, reps: nil, weight: nil, distance: 3.1)

    render_inline(described_class.new(workout_exercise: workout_exercise))

    expect(page).to have_text("3.1 miles")
  end

  it "does not render a Remove link by default" do
    workout_exercise = create(:workout_exercise, exercise: exercise)

    render_inline(described_class.new(workout_exercise: workout_exercise))

    expect(page).not_to have_link("Remove")
  end

  it "renders a Remove link when show_remove_link is true" do
    workout_exercise = create(:workout_exercise, exercise: exercise)

    render_inline(described_class.new(workout_exercise: workout_exercise, show_remove_link: true))

    expect(page).to have_link("Remove")
  end
end