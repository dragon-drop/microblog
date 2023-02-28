class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    validates_uniqueness_of :user_id, scope: :post_id
    validate :user_cannot_be_post_owner

    def user_cannot_be_post_owner
      errors.add(:user, "Cannot like their own post") if user_id == Post.find(post_id).user_id
    end
end
  
# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
