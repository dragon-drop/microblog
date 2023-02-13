class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  has_many :likes
  validates :body, presence: true

  after_create_commit { broadcast_prepend_to "posts" }
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
