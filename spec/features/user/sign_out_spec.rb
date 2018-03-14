require "rails_helper"

RSpec.describe "Sign Out", type: :feature do
  let(:user) { create :user }

  it "User signs out" do
    sign_in(user.email, "123456")

    visit root_path

    click_link "Logout"

    expect(page).to have_content("Logged out!")
  end
end
