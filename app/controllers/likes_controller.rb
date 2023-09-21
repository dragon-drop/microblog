class LikesController < ApplicationController
  before_action :find_post

  def create
    @post.likes.create(user: current_user)
  end

  def destroy
    @post.likes.find_by(user: current_user)&.destroy
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
