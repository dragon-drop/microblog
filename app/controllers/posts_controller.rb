class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user: current_user))
    if @post.save
      redirect_to @post
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
