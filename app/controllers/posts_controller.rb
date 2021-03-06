class PostsController < ApplicationController
  before_action :authenticate_user!, only: :create
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)

    @post.save

    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
