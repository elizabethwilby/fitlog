class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises, dependent: :destroy
  has_many :exercises, through: :workout_exercises
  has_many :workout_logs, dependent: :destroy

  validates :name, presence: true

  def scheduled_days
    days = []
    days << "Monday" if monday
    days << "Tuesday" if tuesday
    days << "Wednesdday" if wednesday
    days << "Thursday" if thursday
    days << "Friday" if friday
    return days
  end
end


