class PostsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @post = Post.new
    @posts = Post.includes(:reactions).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create # rubocop:disable Metrics/AbcSize
    @post = Post.new(post_params.merge(user: current_user))
    respond_to do |format|
      if @post.save
        format.turbo_stream
        format.html { redirect_to root_path }
      else
        format.turbo_stream do
          flash.now[:alert] = @post.errors.full_messages
        end

        format.html do
          flash[:post_errors] = @post.errors.full_messages
          redirect_to root_path
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
