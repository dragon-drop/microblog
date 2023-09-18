class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post
  counter_culture :post

  validates :post_id, uniqueness: { scope: :user_id }
end

# == Schema Information
#
# Table name: reactions
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reactions_on_post_id              (post_id)
#  index_reactions_on_user_id              (user_id)
#  index_reactions_on_user_id_and_post_id  (user_id,post_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
