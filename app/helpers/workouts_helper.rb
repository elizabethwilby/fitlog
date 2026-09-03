module WorkoutsHelper
  def formatted_completed_at(workout_log)
    workout_log.completed_at.strftime("%B %-d, %Y at %-I:%M %p")
  end
end
