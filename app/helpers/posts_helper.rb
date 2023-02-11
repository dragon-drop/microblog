module PostsHelper
  def like_text(post, user)
    if post.liked_by?(user:)
      "Unlike!"
    else
      "Like!"
    end
  end
end
