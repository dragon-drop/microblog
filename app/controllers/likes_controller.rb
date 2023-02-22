class LikesController < ApplicationController
  def create
    @post = Post.find(params[:likeable_id])

    if @post.likes.any? && @post.liked?(current_user)
      @like = Like.find_by(likeable_id: @post.id, user_id: current_user)
      @like.destroy
    else
      @like = @post.likes.new(user: current_user)
      @like.save!
    end
  end
end