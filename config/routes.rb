Rails.application.routes.draw do
  resources :workouts do
    resources :workout_exercises

    member do
      post :complete
    end

    collection do
      get :history
    end
  end

  get "pages/home"
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end