class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  enum state: {
    liked: 0,
    unliked: 1
  }
end

# == Schema Information
#
# Table name: votes
#
#  id            :bigint           not null, primary key
#  state         :integer          default("liked")
#  voteable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#  voteable_id   :bigint           not null
#
# Indexes
#
#  index_votes_on_user_id                                    (user_id)
#  index_votes_on_user_id_and_voteable_id_and_voteable_type  (user_id,voteable_id,voteable_type) UNIQUE
#  index_votes_on_voteable                                   (voteable_type,voteable_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
