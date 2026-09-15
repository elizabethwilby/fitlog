class AddDaysOfWeekToWorkout < ActiveRecord::Migration[8.1]
  def change
    add_column :workouts, :monday, :boolean, default: false
    add_column :workouts, :tuesday, :boolean, default: false
    add_column :workouts, :wednesday, :boolean, default: false
    add_column :workouts, :thursday, :boolean, default: false
    add_column :workouts, :friday, :boolean, default: false
  end
end
