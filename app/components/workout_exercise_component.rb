class WorkoutExerciseComponent < ViewComponent::Base
  attr_reader :workout_exercise, :show_remove_link

  def initialize(workout_exercise:, show_remove_link: false)
    @workout_exercise = workout_exercise
    @show_remove_link = show_remove_link
  end
end