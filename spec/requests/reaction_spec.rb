require "rails_helper"
require "support/shared/request_contexts"
require "support/shared/request_specs"

RSpec.describe "Reaction requests" do
  describe "POST /reactions" do
    let(:req) { post reactions_url, params: { post_id: post_message.id }, as: :turbo_stream }

    include_context "with user logged in"

    context "when reaction is missed" do
      let(:post_message) { create(:post, user: create(:user)) }

      before { post_message.reactions.where(user_id: user.id).destroy_all }

      it "creates a Reaction that belongs to the logged in user and post", :aggregate_failures do
        expect { req }.to change(Reaction, :count).by(1)
        expect(Reaction.last.user).to eq user
        expect(Reaction.last.post).to eq post_message
      end
    end

    context "when reaction exists" do
      let(:post_message) { create(:post, user: create(:user)) }

      before { post_message.reactions.create(user:) }

      it "deletes a Reaction that belongs to the logged in user and post", :aggregate_failures do
        expect { req }.to change(post_message.reactions, :count).by(-1)
      end
    end

    context "when reaction from the post owner" do
      let(:post_message) { create(:post, user:) }

      before { post_message.reactions.where(user_id: user.id).destroy_all }

      it "prevents a Reaction created by the post owner", :aggregate_failures do
        expect { req }.not_to change(Reaction, :count)
      end
    end
  end
end
