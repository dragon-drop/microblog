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

  describe "POST /posts" do
    let(:req) { post posts_url, params: { post: post_params } }
    let(:post_params) { { body: "This is a post" } }

    it_behaves_like "an authenticated route"

    context "with a user logged in" do
      include_context "with user logged in"

      context "with valid params" do
        let(:post_params) { { body: "This is a post" } }

        it "creates a Post that belongs to the logged in user", :aggregate_failures do
          expect { req }.to change(Post, :count).by 1
          expect(Post.last.user).to eq user
        end

        it "redirects to the root path" do
          req

          expect(response).to redirect_to root_path
        end
      end

      context "with invalid params" do
        let(:post_params) { { body: "" } }

        it "doesn't create a post" do
          expect { req }.not_to change(Post, :count)
        end

        it "redirects to the root path" do
          req

          expect(response).to redirect_to root_path
        end
      end
    end
  end
end
