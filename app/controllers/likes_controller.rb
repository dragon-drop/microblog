class LikesController < ApplicationController 
    before_action :authenticate_user!
    before_action :get_post

    def create
        if user_signed_in?
            @like = Like.new(user_id: current_user.id, post_id: @post.id)
            @like.save
            redirect_to root_path
        else
            redirect_to root_path
        end
    end


    def destroy
        @like = Like.find(params[:id])
        @like.destroy

        redirect_to root_path
    end

    private

    def get_post
        @post = Post.find(params[:post_id])
    end
end