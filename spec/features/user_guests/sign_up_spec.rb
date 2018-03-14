require "rails_helper"

RSpec.describe "Sign Up", type: :feature do
  let(:user_attributes) { attributes_for(:user).slice(:email, :password, :password_confirmation) }

  it "Visitor signs up" do
    visit new_user_path

    fill_in "user[email]", with: user_attributes[:email]
    fill_in "user[password]", with: user_attributes[:password]
    fill_in "user[password_confirmation]", with: user_attributes[:password_confirmation]
    click_button "Create User"

    expect(page).to have_content("Please login first")
  end
end
