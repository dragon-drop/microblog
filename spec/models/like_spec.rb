require "rails_helper"
require "support/shoulda_matchers"

RSpec.describe Like do
  describe "validations" do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { Post.create(user: user, body: "Hello!") }
    let(:user_2) { User.create(email: "test@abc.com", password: "123456") }

    it "should not be possible for a User to like their own post" do
      like = Like.create(user: user, post: post)

      expect(like).to_not be_valid
    end

    it "should not be possible for a User to like a post twice" do
      like = Like.create(user: user_2, post: post)
      like_2 = Like.create(user: user_2, post: post)

      expect(like).to be_valid
      expect(like_2).to_not be_valid
    end
  end
end
