require 'rails_helper'

RSpec.describe Like, type: :model do
  it "validates uniqueness of like" do
    user = create(:user)
    post = create(:post, user_id: user.id)

    create(:like, user_id: user.id, post_id: post.id)
    second_like = build(:like, user_id: user.id, post_id: post.id)

    expect(second_like.valid?).to be false
  end
end
