require "rails_helper"
require "support/shoulda_matchers"

RSpec.describe Post do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_rich_text(:body) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :body }
  end

  describe "likes_count" do
    subject(:post) { create(:post, user:) }

    let(:user) { create(:user) }

    it "increases like counter" do
      expect { create(:like, user:, post:) }.to change(post, :likes_count).by 1
    end

    it "decreases like counter" do
      like = create(:like, user:, post:)

      expect { like.destroy }.to change(post, :likes_count).by -1
    end
  end
end
