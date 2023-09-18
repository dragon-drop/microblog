module Posts
  class ToggleReaction
    def initialize(post:, user:)
      @post = post
      @user = user
      @reaction = user.reactions.find_by(post_id: post.id)
    end

    def call
      reaction.present? ? reaction.destroy : user.reactions.create(post:)
    end

    private

    attr_reader :post, :user, :reaction
  end
end
