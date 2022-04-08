class LikesController < ApplicationController
  before_action :find_post

  def create
    @post.increment!(:likes)
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
