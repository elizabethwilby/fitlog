# FitLog

FitLog is a workout tracking app built with Ruby on Rails. Users can build their own workouts out of a shared catalog of exercises, add their own sets, reps, and weight (or duration and distance for cardio exercises), and log when they've actually completed a workout so they can look back on their history over time.

## Installation

1. Clone this repo: `git clone https://github.com/elizabethwilby/fitlog.git`
2. Navigate into the project: `cd fitlog`
3. Install dependencies: `bundle install`
4. Set up the database: `rails db:create db:migrate`
5. Start the server: `rails server`
6. Visit `localhost:3000` in your browser

## Planned PRs

- **PR 1: Models and migrations** - create User, Exercise, Workout, WorkoutExercise, and WorkoutLog models with their associations and validations
- **PR 2: Authentication** - add Devise for signup, login, and logout
- **PR 3: Workouts CRUD** - create, view, edit, and delete workouts
- **PR 4: Nested exercises** - add exercises to a specific workout through a nested resource, with a form scoped to the parent workout
- **PR 5: Completing workouts** - mark a workout as completed, log it with a timestamp, and add a scope for filtering completed workouts
- **PR 6: Tests** - RSpec model specs for all models, at least one integration spec, using FactoryBot for test data
