require "rails_helper"

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }

  describe "validations" do
    it { is_expected.to validate_length_of(:password).is_at_least(3) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "associations" do
    it { is_expected.to have_many :urls }
  end
end
