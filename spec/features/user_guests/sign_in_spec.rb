require "rails_helper"

RSpec.describe "Sign In", type: :feature do
  let(:user) { create :user }

  it "Guest signs in with valid credentials" do
    sign_in(user.email, "123456")
    expect(page).to have_content("Login successful")
    expect(page).to have_content(user.email)
  end

  it "Visitor signs in with wrong password" do
    sign_in(user.email, "wrong password")
    expect(page).to have_content("Login failed")
  end

  it "Visitor signs in with wrong email" do
    sign_in(user.email.reverse, "123456")
    expect(page).to have_content("Login failed")
  end
end
