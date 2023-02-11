module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :likes, class_name: :Vote, as: :voteable, dependent: :destroy, inverse_of: :voteable
  end

  def vote_up!(user:)
    like = likes.find_or_create_by(user:)
    like.liked!
  end
  alias like! vote_up!

  def vote_down!(user:)
    likes.find_by(user:)&.unliked!
  end
  alias dislike! vote_down!

  def liked_by?(user:)
    likes.where(state: :liked, user:).any?
  end

  def toggle_like!(user:)
    if likes.where(state: :liked, user:).any?
      vote_down!(user:)
    else
      vote_up!(user:)
    end
  end


end
