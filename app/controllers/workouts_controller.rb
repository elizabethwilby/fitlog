class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, only: %i[show edit update destroy complete]

  def index
    @workouts = current_user.workouts
  end

  def show; end

  def new
    @workout = current_user.workouts.build
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to @workout, notice: "Workout created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path, notice: "Workout deleted."
  end

  def complete
    current_user.workout_logs.create!(workout: @workout, completed_at: Time.current)
    redirect_to @workout, notice: "Workout marked complete!"
  end

  def history
    @workout_logs = current_user.workout_logs.completed.order(completed_at: :desc)
  end

private

  def set_workout
    @workout = current_user.workouts.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :notes)
  end
end
