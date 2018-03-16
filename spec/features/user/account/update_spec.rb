require "rails_helper"

RSpec.describe "Update Account", type: :feature do
  let(:user) { create :user }

  before do
    sign_in(user.email, "123456")
    visit edit_user_path(user)
  end

  it "User enters not matched passwords" do
    fill_in "user[password]", with: "qwerty"
    fill_in "user[password_confirmation]", with: "123123"
    click_on "Update user"

    expect(page).to have_content("doesn't match Password")
  end
end
