class Post < ApplicationRecord
  has_many :reactions, dependent: :destroy
  belongs_to :user
  has_rich_text :body

  validates :body, presence: true
end

# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  reactions_count :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
