require "rails_helper"
require "support/shoulda_matchers"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
  end
end
