class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:create, :destroy]
  before_action :find_like, only: :destroy

  def create
    @post.likes.create(user: current_user)
    redirect_to @post
  end

  def destroy
    @like.destroy
    redirect_to @post
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = current_user.likes.find_by(post_id: params[:post_id])
  end
end
