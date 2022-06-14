require "rails_helper"

RSpec.describe "Likes", type: :request do
  describe "post /create" do
    let(:post_path) { create(:post).id }
    let(:req) { post post_likes_url(post_path) }
    let(:user) { create(:user) }

    context "with a user" do
      let(:user) { create(:user) }

      before { login_as user }

      it "creates a new like" do
        expect { req }.to change(Like, :count).by 1
      end
    end
  end
end
