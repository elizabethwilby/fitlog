class WorkoutLog < ApplicationRecord
  belongs_to :user
  belongs_to :workout

  scope :completed, -> { where.not(completed_at: nil) }
end
