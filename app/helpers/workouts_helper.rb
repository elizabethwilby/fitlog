module WorkoutsHelper
  def formatted_completed_at(workout_log)
    workout_log.completed_at.strftime("%A, %B %-d, %Y at %-I:%M %p")
  end

  def days_of_week
    [:monday, :tuesday, :wednesday, :thursday, :friday]
  end
end


