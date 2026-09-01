class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :workouts
  has_many :workout_logs
  has_many :completed_workouts, through: :workout_logs, source: :workout
  has_many :workout_exercises, through: :workouts
  has_many :exercises, through: :workout_exercises

  validates :username, presence: true

  validate :password_complexity

  private

  def password_complexity
    return if password.blank?

    unless password.match?(/\A(?=.*[A-Z])(?=.*\d).+\z/)
      errors.add(:password, "must include at least one capital letter and number. Must be 6 characters.")
    end
  end
end
