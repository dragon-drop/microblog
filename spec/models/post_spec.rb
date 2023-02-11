require "rails_helper"
require "support/shoulda_matchers"
require "models/concerns/voteable_spec"

RSpec.describe Post do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_rich_text(:body) }
    it_behaves_like "voteable"
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :body }
  end

  describe "#toggle_like!" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    context "when called for the first time" do
      it "liked the post" do
        post.toggle_like!(user: user)
        expect(post.likes.liked.count).to be(1)
      end
    end

    context "when called for the second time" do
      it "disliked the post" do
        post.toggle_like!(user: user)
        post.toggle_like!(user: user)
        expect(post.likes.unliked.count).to be(1)
      end
    end
  end
end
