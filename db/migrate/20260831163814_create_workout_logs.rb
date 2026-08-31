class CreateWorkoutLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :workout_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true
      t.datetime :completed_at
      t.text :notes

      t.timestamps
    end
  end
end
