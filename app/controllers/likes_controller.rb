class LikesController < ApplicationController
  before_action :require_current_user

  rescue_from RuntimeError do |error|
    render status: :unprocessable_entity, json: error.to_json
  end

  def create
    @like = current_user.likes.new(like_params)
    raise("Your are already liked this post") unless @like.save

    redirect_to root_path
  end

  private

  def like_params
    params.require(:like).permit(
      :likeable_id,
      :likeable_type
    )
  end

  def require_current_user
    return if current_user.present?

    render status: :unauthorized, json: "Please authentificate for liking posts".to_json
  end
end
