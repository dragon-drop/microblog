class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_rich_text :body

  validates :body, presence: true

  # Moved to controller (might be a terrible idea) in order to pass devise variables 
  # through to the newly rendered partial
  # after_create_commit { broadcast_prepend_to "posts" }

  def has_user_liked?(user)
    user.likes.pluck(:post_id).include?(id)
  end
end

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
