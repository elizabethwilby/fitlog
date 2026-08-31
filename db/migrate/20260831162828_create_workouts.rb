class CreateWorkouts < ActiveRecord::Migration[8.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
