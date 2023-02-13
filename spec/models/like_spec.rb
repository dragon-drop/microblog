require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @post_a = create(:post)
    @like = create(:like)
  end

  it 'New post should have zero Likes' do
    expect(@post_a.likes.count).to equal 0
  end

  it "A New Like increases the Post's like-count by 1" do
    @mini_post = @like.post
    expect(@mini_post.likes.count).to eq 1
  end
end
