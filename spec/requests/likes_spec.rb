require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "POST /posts/:id/likes" do
    let(:request) { post("/posts/#{post_image.id}/likes", params: params) }
    let(:post_image) { FactoryBot.create(:post) }
    let(:params) do
      {
        like:    {
          likeable_id:   post_image.id,
          likeable_type: "Post"
        }
      }
    end

    context "with an user" do
      let(:user) { create(:user) }

      before { login_as user }

      context "when success case" do
        it "creates a new like" do
          expect { request }.to change(Like, :count).by 1
        end

        it "associates the like with the liked post" do
          request

          expect(Like.last.likeable_id).to eq post_image.id
        end

        it "redirects to the root url" do
          request
          expect(response.status).to eq 302
        end
      end

      context "when like was not saved" do
        before { allow_any_instance_of(Like).to receive(:save).and_return(false) }

        it "responds with 422 Unprocessable Entity" do
          request
          expect(response.status).to eq 422
          expect(JSON.parse(response.body)).to eq "Your are already liked this post"
        end
      end
    end

    context "without an user" do
      it "responds with 401 Invalid Credentials" do
        request
        expect(response.status).to eq 401
        expect(JSON.parse(response.body)).to eq "Please authentificate for liking posts"
      end
    end
  end
end
