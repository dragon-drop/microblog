require "rails_helper"
require "support/shoulda_matchers"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
  end

  describe "#likes?" do
    subject(:user) { create(:user) }

    let(:post) { create(:post, user:) }

    before { create(:like, user:, post:) }

    it { expect(user.likes?(post)).to be_truthy }
  end
end
