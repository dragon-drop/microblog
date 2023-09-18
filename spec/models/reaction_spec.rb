require "rails_helper"

RSpec.describe Reaction do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end

  describe "validations" do
    subject { create(:reaction) }

    it { is_expected.to validate_uniqueness_of(:post_id).scoped_to(:user_id) }
  end
end
