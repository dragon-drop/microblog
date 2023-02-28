require "rails_helper"
require "support/shared/request_contexts"
require "support/shared/request_specs"

RSpec.describe "Posts requests" do
  describe "GET /" do
    let(:req) { get root_url }

    it_behaves_like "an authenticated route"
    context "with a user logged in" do
      include_context "with user logged in"
      include_examples "a successful response"
    end
  end

  describe "POST /posts/:id/likes" do
    let(:new_user) { User.create(email: "test@abc.com", password: "123456") }
    let(:new_post) { Post.create(user: new_user, body: "Hello!") }
    let(:req) { post "/posts/#{new_post.id}/likes", params: { post_id: new_post.id } }

    it_behaves_like "an authenticated route"

    context "with a user logged in" do
      include_context "with user logged in"

      context "with valid params" do
        it "creates a Like for the given post that belongs to the logged in user" do
          expect { req }.to change(Like, :count).by 1
          expect(Like.last.user).to eq user
        end

        it "redirects to the root path" do
          req

          expect(response).to redirect_to root_path
        end
      end
    end
  end
end
