class ReactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])

    authorize @post
    Posts::ToggleReaction.new(post: @post, user: current_user).call
  rescue Pundit::NotAuthorizedError
    # Do nothing. UI wouldn't change. Or we can add an alert about unfairness to liking your own posts
  end
end
