require "rails_helper"
require "support/shoulda_matchers"

RSpec.describe Post do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_rich_text(:body) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :body }
  end
end
