require "rails_helper"

RSpec.describe "Workouts", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /workouts" do
    it "returns a successful response" do
      get workouts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /workouts" do
    it "creates a new workout and redirects" do
      expect {
        post workouts_path, params: { workout: { name: "Leg Day", notes: "Squats and lunges" } }
      }.to change(Workout, :count).by(1)
      expect(response).to redirect_to(Workout.last)
    end

    it "does not create a workout without a name" do
      expect {
        post workouts_path, params: { workout: { name: "" } }
      }.not_to change(Workout, :count)
    end
  end

  describe "DELETE /workouts/:id" do
    it "destroys the workout and redirects" do
      workout = create(:workout, user: user)
      expect {
        delete workout_path(workout)
      }.to change(Workout, :count).by(-1)
      expect(response).to redirect_to(workouts_path)
    end
  end
end