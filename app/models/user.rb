class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :workouts
  has_many :workout_logs
  has_many :completed_workouts, through: :workout_logs, source: :workout
  has_many :workout_exercises, through: :workouts
  has_many :exercises, through: :workout_exercises
end
