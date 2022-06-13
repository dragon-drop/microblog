require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "POST /posts/:post_id/likes" do
    let(:post_id) { create(:post).id }
    let(:req) { post post_likes_url(post_id) }

    context "with a user" do
      let(:user) { create(:user) }

      before { login_as user }

      it "creates a new like" do
        expect { req }.to change(Like, :count).by 1
      end

      it "associates the post with the logged in user" do
        req

        expect(Like.last.user).to eq user
      end

      it "redirects to the root url" do
        req
        expect(response).to redirect_to root_url
      end
    end

    context "without a user" do
      it "does not create a new like" do
        expect { req }.not_to change(Like, :count)
      end

      it "redirects to the new session url" do
        req

        expect(response).to redirect_to new_user_session_url
      end
    end
  end

  describe "DELETE /posts/:post_id/likes/:id" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user_id: user.id) }
    let(:like) { create(:like, post_id: post.id, user_id: user.id) }
    let(:req) { delete post_like_url(post.id, like.id) }

    before { login_as user }

    it "Deletes successfully" do
      req

      expect(post.likes.count).to be 0
    end
  end
end
