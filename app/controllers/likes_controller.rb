class LikesController < ApplicationController
  def create
    @user_id = current_user.id
    @post_id = params[:post_id]

    @like = Like.new(
      user_id: @user_id,
      post_id: @post_id
    )
    @like.save unless Like.find_by(user_id: @user_id, post_id: @post_id)
    redirect_back_or_to root_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user_id: current_user.id)
    @like.destroy if @like
    redirect_back_or_to root_path
  end
end
