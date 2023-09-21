require "rails_helper"
require "support/shared/request_contexts"

RSpec.describe "Likes requests" do
  let(:blog_post) { create(:post) }

  describe "POST /like_post" do
    include_context "with user logged in"

    let(:request) { post like_post_path(blog_post), as: :turbo_stream }

    it "adds like to the post" do
      expect { request }.to change(Like, :count).by(1)
    end
  end

  describe "DELETE /unlike_post" do
    include_context "with user logged in"

    let(:request) { delete unlike_post_url(blog_post), as: :turbo_stream }

    it "removes like from the post" do
      blog_post.likes.create(user:)

      expect { request }.to change(Like, :count).by(-1)
    end
  end
end
