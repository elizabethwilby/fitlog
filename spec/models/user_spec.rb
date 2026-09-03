require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with a username, email, and password" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = build(:user, username: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a unique email" do
    create(:user, email: "dupe@example.com")
    user = build(:user, email: "dupe@example.com")
    expect(user).not_to be_valid
  end

  it "is invalid without a capital letter in the password" do
    user = build(:user, password: "password1")
    expect(user).not_to be_valid
  end

  it "is invalid without a number in the password" do
    user = build(:user, password: "Password")
    expect(user).not_to be_valid
  end

  it "has many workouts" do
    association = User.reflect_on_association(:workouts)
    expect(association.macro).to eq(:has_many)
  end
end