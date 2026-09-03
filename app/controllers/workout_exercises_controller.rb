class WorkoutExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout

  def index
    @workout_exercises = @workout.workout_exercises
  end

  def new
    @workout_exercise = @workout.workout_exercises.build
  end

  def create
    @workout_exercise = @workout.workout_exercises.build(workout_exercise_params)

    if @workout_exercise.save
      redirect_to workout_path(@workout), notice: "Exercise added to workout."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @workout_exercise = @workout.workout_exercises.find(params[:id])
    @workout_exercise.destroy
    redirect_to workout_path(@workout), notice: "Exercise removed from workout."
  end

private

  def set_workout
    @workout = current_user.workouts.find(params[:workout_id])
  end

  def workout_exercise_params
    params.require(:workout_exercise).permit(:exercise_id, :sets, :reps, :weight, :duration_minutes, :distance)
  end
end
