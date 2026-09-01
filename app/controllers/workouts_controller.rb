class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workouts = current_user.workouts
  end

  def show
    @workout = current_user.workouts.find(params[:id])
  end

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

  def edit
    @workout = current_user.workouts.find(params[:id])
  end

  def update
    @workout = current_user.workouts.find(params[:id])

    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout = current_user.workouts.find(params[:id])
    @workout.destroy
    redirect_to workouts_path, notice: "Workout deleted."
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :notes)
  end
end