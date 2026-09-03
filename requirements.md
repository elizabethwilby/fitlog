# Specifications for the Rails Assessment

Add notes below each checkbox with how your application has met the requirement

Requirements:
- [x] Uses Ruby on Rails
  Rails 8.1.3.1.

- [x] Includes at least one has_many relationship (e.g. User has_many Recipes)
  Got a bunch of these. User has_many :workouts, Workout has_many :workout_exercises, etc.

- [x] Includes at least one belongs_to relationship (e.g. Post belongs_to User)
  Workout belongs_to :user, WorkoutExercise belongs_to :workout and :exercise, WorkoutLog belongs_to :user and :workout.

- [x] Includes at least two has_many through relationships (e.g. a `Recipe` could `has_many` `Item`s through `Ingredient`s)
  User has_many :exercises through :workout_exercises, and User has_many :completed_workouts through :workout_logs (source: :workout).

- [x] Every model contains at least at least two simple attributes (e.g. ingredient#quantity)
  Exercise has name/category, Workout has name/notes, WorkoutExercise has sets/reps/weight/duration_minutes/distance, WorkoutLog has completed_at/notes, User has username/email.

- [x] Includes reasonable validations
  Presence checks on name/username, a custom password validation (needs a capital letter + a number + at least 6 characters), and numericality checks on the WorkoutExercise fields so you can't put in a negative number of sets or reps.

- [x] Includes a class level ActiveRecord scope method
  WorkoutLog.completed - filters logs down to ones that actually have a completed_at set. Used on the history page.

- [x] Includes signup, login and logout functionality (e.g. Devise)
  Using Devise for this, added a username field on top of the default email/password, plus my own password validation.

- [x] Includes nested resource show or index (e.g. users/2/recipes)
  /workouts/:workout_id/workout_exercises - shows the exercises attached to one specific workout.

- [x] Includes nested resource form (recipes/1/ingredients/new)
  /workouts/:workout_id/workout_exercises/new - form to add an exercise to a specific workout, pulling from the exercise catalog.

- [x] Includes form display of validation errors
  Both the Workout and WorkoutExercise forms show errors.full_messages if something doesn't save.

- [x] Includes Unit tests all of your models
  RSpec specs for all 5 models - 23 examples, all passing.

- [x] Includes at least one type of Integration test (e.g. controller, request, feature, system)
  Request spec for WorkoutsController covering index, create, and destroy.

- [x] Use FactoryBot to build instances of your models in your tests
  Factories for all 5 models, used throughout the specs.

- [x] Conforms to Nitro Ruby linting rules (running `rubocop` returns 0 offenses)
  Ran rubocop -A to autocorrect everything it could, excluded the auto-generated schema files that aren't really my code (queue/cache/cable schema). Comes back clean now.

- [x] Includes a `README.md` with an application description and installation guide
  Has a description, install steps, and a rough breakdown of what I built in each PR.

Confirm:
- [x] The application is pretty DRY
  Nav bar lives in the layout so it's not repeated on every page, and the date formatting/exercise list markup got pulled out into a helper and a partial instead of being copy-pasted.

- [x] Limited logic in controllers
  Controllers mostly just call things like current_user.workouts or WorkoutLog.completed - the actual logic lives in the models.

- [x] Views use helper methods if appropriate
  Added a formatted_completed_at helper in WorkoutsHelper that handles the date formatting on the history page instead of doing it inline.

- [x] Views use partials if appropriate
  Pulled the exercise list item markup into a _workout_exercise partial, rendered with render @workout.workout_exercises.

If you've added any additional functionality to your application that you'd like to demonstrate, please describe it below:

Marking a workout as complete creates a WorkoutLog with a timestamp on it, and there's a separate history page where you can see everything you've actually finished, most recent first.