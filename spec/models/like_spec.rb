require "rails_helper"
require "support/shoulda_matchers"

RSpec.describe Like do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end

  describe "validations" do
    subject { create(:like) }

    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end
end
