require "rails_helper"

RSpec.describe "User creates new url", type: :feature do
  let(:user) { create :user }
  let(:url_attributes) { attributes_for(:url) }
  let(:created_url) { Url.find_by(long_url: url_attributes[:long_url]) }

  before do
    sign_in(user.email, "123456")
    visit new_url_path
  end

  it "with valid parameters" do
    fill_in "url[long_url]", with: url_attributes[:long_url]
    fill_in "url[short_url]", with: url_attributes[:short_url]
    fill_in "url[life_term]", with: url_attributes[:life_term]
    fill_in "url[delay_time]", with: url_attributes[:delay_time]

    click_button "Create link"

    expect(page).to have_content "#{URI.parse(current_url).host}/#{created_url.short_url}"
  end

  it "with empty long url" do
    fill_in "url[long_url]", with: ""
    fill_in "url[short_url]", with: url_attributes[:short_url]

    click_button "Create link"

    expect(page).to have_content "can't be blank"
  end
end
