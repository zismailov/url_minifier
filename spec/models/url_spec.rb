require "rails_helper"

RSpec.describe Url, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :long_url }
    it { is_expected.to validate_uniqueness_of :short_url }
    it { is_expected.to validate_numericality_of :life_term }
    it { is_expected.to validate_numericality_of :delay_time }
  end

  describe "associations" do
    it { is_expected.to belong_to :user }
  end
end
