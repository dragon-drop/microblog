class PostsController < ApplicationController
  before_action :authenticate_user!
  include ActionView::RecordIdentifier

  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end

  def create # rubocop:disable Metrics/AbcSize
    @post = Post.new(post_params.merge(user: current_user))
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path }
      else
        format.turbo_stream
        format.html do
          flash[:post_errors] = @post.errors.full_messages
          redirect_to root_path
        end
      end
    end
  end

  def toggle_like
    @post = Post.find(params[:id])
    @post.toggle_like!(user: current_user)
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "#{dom_id(@post)}_likes",
          partial: "posts/likes",
          locals: { post: @post, user: current_user }
        )
      end
    end

  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
